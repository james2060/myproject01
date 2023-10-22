import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:myproject01/screen/authentication/sign_in_screen.dart';
import 'package:myproject01/utils/constants.dart';
import 'package:get/get.dart';
import 'package:myproject01/controller/auth_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await firebaseInitialization.then((value) => {
      //Get.put(AuthController()),
  });

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }
  initialization();

  runApp(GreensApp());
}


class GreensApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Greens',
      home: const SignInScreen(),
    );
  }
}
