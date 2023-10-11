
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myproject01/screen/authentication/sign_in_screen.dart';
import 'package:myproject01/screen/home_screen.dart';
import 'package:myproject01/utils/constants.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();

    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
    ever(firebaseUser, _setInitializeScreen);
  }

  _setInitializeScreen(User? user) {

    if(user == null) {
        debugPrint('auth user is null');
        Get.offAll(() => SignInScreen());
    }else {
      debugPrint('auth user is not null, going home');
      debugPrint(user.displayName.toString());
      Get.offAll(() => HomeScreen(user: user));
    }
  }

  void register(String email, password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(firebaseAuthException){}
  }
  void login(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } catch(firebaseAuthException){}
  }
}