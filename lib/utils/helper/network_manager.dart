import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();

  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;

  // initialize the network manager and set up a stream to continually check the connection status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // update the connection status based on changes in connectivity and show a relevant page for no internet
  Future<void> _updateConnectionStatus(ConnectivityResult result) async{
    _connectivityStatus.value = result;
    if(result == ConnectivityResult.none){
      TLoaders.warningSnackBar(title:'No internet connection');
    }
  }

  // check the connection status, return true for connected or false
  Future<bool> isConnected() async{
    try{
      final result = await connectivity.checkConnectivity();
      if(result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_){
      return false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _connectivitySubscription.cancel();
  }
}