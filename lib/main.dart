import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/repository/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  /// Add widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  /// Init local storage
  await GetStorage.init();
  /// Init payment methods
  /// Await native splash until other loads
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  /// Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository())
  );
  /// Initialize authentication

  runApp(const App());
}
