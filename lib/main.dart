import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:myproject01/screen/authentication/sign_in_screen.dart';
import 'package:myproject01/utils/constants.dart';
import 'package:get/get.dart';
import 'package:myproject01/controller/auth_controller.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) => {
      //Get.put(AuthController()),
  });
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