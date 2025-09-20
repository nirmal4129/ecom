import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();
  ///variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
 /// update page index when scroll
 // void updatePageIndicator(index){
 //  currentPageIndex = index;
 // }

  void updatePageIndicator(index)=> currentPageIndex.value = index;

 // jump to specific dot selected page
  void dotNavigationOnClick(index){
   currentPageIndex.value = index;
   pageController.jumpTo(index);
  }

  // update current index and jump to next page
  void nextPage(){
   if(currentPageIndex.value==2){
    Get.offAll(const LoginScreen());
   }else{
     int page = currentPageIndex.value + 1;
    pageController.jumpToPage(page);
   }
  }

  // update current index and go back to previous page
  void skipPage(){
   currentPageIndex.value = 2;
   pageController.jumpToPage(2);
  }
}