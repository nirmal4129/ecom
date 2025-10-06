import 'package:ecom/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helper/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async{
    try{
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
      if (!formKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // send email reset link
      await AuthenticationRepository.instance.sendPasswordResetLink(email.text.trim());

      // remove loader
      FullScreenLoader.stopLoading();

      // show success snack bar
      TLoaders.successSnackBar(title:'Email sent',message:'Email Link Sent to Reset Your Password'.tr);

      // Redirect 
      Get.to(()=>ResetPassword(email: email.text.trim(),));
    }catch(e){
      // remove loader
      FullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try{
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

      // send email reset link
      await AuthenticationRepository.instance.sendPasswordResetLink(email);

      // remove loader
      FullScreenLoader.stopLoading();

      // show success snack bar
      TLoaders.successSnackBar(title:'Email sent',message:'Email Link Sent to Reset Your Password'.tr);

    }catch(e){
      // remove loader
      FullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}