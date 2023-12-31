import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject01/screen/common/resource/custom_colors.dart';

import 'package:myproject01/screen/common/custom_form_field.dart';
import 'package:myproject01/screen/authentication/register_screen.dart';
import 'package:myproject01/screen/authentication/user_info_screen.dart';
import 'package:myproject01/screen/home_screen.dart';
import 'package:myproject01/utils/authentication.dart';
import 'package:myproject01/utils/validator.dart';
import 'package:get/get.dart';

class SignInForm extends StatefulWidget {
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  const SignInForm({
    Key? key,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  }) : super(key: key);
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _signInFormKey = GlobalKey<FormState>();

  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              children: [
                CustomFormField(
                  controller: _emailController,
                  focusNode: widget.emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  label: 'Email',
                  hint: 'Enter your email',
                ),
                const SizedBox(height: 16.0),
                CustomFormField(
                  controller: _passwordController,
                  focusNode: widget.passwordFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validatePassword(
                    password: value,
                  ),
                  isObscure: true,
                  label: 'Password',
                  hint: 'Enter your password',
                ),
              ],
            ),
          ),
          _isSigningIn
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Palette.firebaseOrange,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Palette.firebaseOrange,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        widget.emailFocusNode.unfocus();
                        widget.passwordFocusNode.unfocus();

                        setState(() {
                          _isSigningIn = true;
                          debugPrint('_isSigninIn is true');
                        });

                        if (_signInFormKey.currentState!.validate()) {
                          User? user =
                              await Authentication.signInUsingEmailPassword(
                            context: context,
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                          if (user != null) {
                            if(user.emailVerified)
                              {
                                debugPrint("email is verified");
                                Get.offAll(() => HomeScreen(user: user));
                              }
                            else {
                              debugPrint('email is not verified');
                              Get.offAll(() =>
                                  UserInfoScreen(
                                      user: user)); //HomeScreen(user: user));
                            }
                          }
                          else{
                            debugPrint('user is null');
                          }
                        }

                        setState(() {
                          _isSigningIn = false;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Palette.firebaseGrey,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              Get.offAll(() => RegisterScreen());
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const RegisterScreen(),
              //   ),
              // );
            },
            child: const Text(
              'Don\'t have an account? Sign up',
              style: TextStyle(
                color: Palette.firebaseGrey,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
