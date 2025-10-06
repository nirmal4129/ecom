import 'package:ecom/data/repository/authentication/authentication_repository.dart';
import 'package:ecom/features/personalization/controllers/user_controller.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/helper/network_manager.dart';
import 'package:ecom/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  //variables
  final localStorage = GetStorage();
  final Rx<bool> hidePassword = true.obs;
  final Rx<bool> rememberMe = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL')??'';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD')??'';
    super.onInit();
  }

//email and password sign in
  Future<void> emailAndPasswordSignIn() async{
    try{

      // start loading
      FullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingDocker);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!signInFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // login user with email and password
      await AuthenticationRepository.instance.signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      FullScreenLoader.stopLoading();

      // screen Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      FullScreenLoader.stopLoading();
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // google signin authentication
  Future<void> googleSignIn() async{
    try{

      // start loading
      FullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingDocker);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }

      // login user with email and password
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      // save user data
      await userController.saveUserData(userCredential);

      // remove loader
      FullScreenLoader.stopLoading();

      // screen Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      FullScreenLoader.stopLoading();
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


}