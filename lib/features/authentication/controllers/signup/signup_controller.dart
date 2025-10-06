import 'package:ecom/data/repository/authentication/authentication_repository.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/helper/network_manager.dart';
import 'package:ecom/utils/popups/full_screen_loader.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repository/user/user_repository.dart';
import '../../../personalization/models/user_models.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final Rx<bool> hidePassword = true.obs;
  final Rx<bool> toggleCheckBox = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // signup
  Future<void> signup() async {
    try {
      // loader
      FullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.loadingDocker,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // privacy policy
      if (!toggleCheckBox.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy!',
          message: 'Accept Privacy Policy & Terms of Use to create an account',
        );
        return;
      }

      // register user in firebase
      final userCred = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // save authenticated user data in the firestore
      final newUser = UserModel(
        id: userCred.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // stop loading
      FullScreenLoader.stopLoading();

      //     show success message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue',
      );

      // move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // FullScreenLoader.stopLoading();
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
