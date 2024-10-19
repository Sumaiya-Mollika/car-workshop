import 'package:car_care/app/ui/components/auth_background_component.dart';
import 'package:car_care/app/ui/components/button_component.dart';
import 'package:car_care/app/ui/components/sadow_container_component.dart';
import 'package:car_care/app/ui/components/text_field_component.dart';
import 'package:car_care/app/ui/components/text_component.dart';
import 'package:car_care/app/ui/screens/sign_up_screen.dart';
import 'package:car_care/app/utils/constants.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/base.dart';


class SignInScreen extends StatelessWidget with Base {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
              buildAuthBackground(),
            _buildForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          _buildTextFieldContainer(),
          const SizedBox(height: 30),
          ButtonComponent(
            text: "Sign In",
            onPressed: () {
            authC.  signIn();
            //  authC.login(); // Call the authentication login method
            },
          ),
          _buildSignUpOption(),
        ],
      ),
    );
  }

  Widget _buildTextFieldContainer() {
    return ShadowContainerComponent(
         Column(
          children: [
            TextFieldComponent(
              hint: "Email",
              onChanged: (v) {},
              textController: authC.emailController.value,
            ),
            const Divider(height: 0, color: kDividerColor),
            TextFieldComponent(
              isPasswordField: true,
              hint: "Password",
              onChanged: (v) {},
              textController: authC.passwordController.value,
            ),
          ],
        ),
    
    );
  }

  Widget _buildSignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextComponent(
          'Don\'t have an account? ',
          color: kGrayColor,
          padding: EdgeInsets.only(right: 5),
        ),
        TextComponent(
          'Sign Up',
          color: lightPrimaryColor,
          fontWeight: titleFontWeight,
          onPressed: () {
            authC.clearValues();
            Get.offAll(() => SignUpScreen(), transition: sendTransition);
          },
        ),
      ],
    );
  }
}
