import 'package:ecom/data/repository/user/user_repository.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_models.dart';
class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepo = Get.put(UserRepository());

  Future<void> saveUserData(UserCredential? userCredential)async{
    try{
      if(userCredential!=null){
        // convert name to first and last name
        final nameParts= UserModel.nameParts(userCredential.user!.displayName??'');
        final username= UserModel.generateUsername(userCredential.user!.displayName??'');

        // map data in user model
        final user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email??'',
            firstName: nameParts[0],
            lastName: nameParts.length>1?nameParts.sublist(1).join():'',
            username: username,
            phoneNumber: userCredential.user!.phoneNumber??'',
            profilePicture: userCredential.user!.photoURL??'');

        // save user data
        await userRepo.saveUserRecord(user);

      }
    }catch(e){
      TLoaders.errorSnackBar(title: 'Data not saved!');
    }
  }
}