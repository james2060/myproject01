import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:myproject01/screen/authentication/sign_in_screen.dart';
import 'package:myproject01/utils/constants.dart';
import 'package:get/get.dart';
import 'package:myproject01/controller/auth_controller.dart';
import 'package:myproject01/controller/match_controller.dart';
import 'package:myproject01/screen/authentication/user_info_screen.dart';
import 'package:myproject01/screen/authentication/register_screen.dart';
import 'package:myproject01/screen/next_match_details_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:myproject01/TestCrud.dart';
Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await firebaseInitialization.then((value) => {
      //Get.put(AuthController()),
  });

  void initialization() async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }
  //initialization();

  runApp(GreensApp());
}
class GreensApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Greens',
      //home: const SignInScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SignInScreen()),
      ],
    );
  }
}
