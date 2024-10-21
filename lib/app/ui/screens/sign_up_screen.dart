import 'package:car_care/app/ui/components/button_component.dart';
import 'package:car_care/app/ui/components/auth_background_component.dart';
import 'package:car_care/app/ui/components/sadow_container_component.dart';
import 'package:car_care/app/ui/components/text_component.dart';
import 'package:car_care/app/ui/components/text_field_component.dart';
import 'package:car_care/app/ui/screens/sign_in_screen.dart';
import 'package:car_care/app/utils/constants.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:car_care/config/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget with Base {
  SignUpScreen({super.key});

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
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          _buildRoleSelection(),
          _buildTextFieldContainer(),
          Obx(
            () => TextComponent(
              authC.passwordErrorMessage.value,
              fontSize: k14FontSize,
              color: kErrorColor,
              padding: const EdgeInsets.only(top: 10),
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => ButtonComponent(
              cancelButton: authC.disableButton(),
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
              text: "Sign Up",
              onPressed: () {
                authC.register();
              },
            ),
          ),
          _buildSignInOption(),
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
            textController: authC.emailController.value,
            onChanged: (String? value) {
              authC.email.value = value!;
            },
          ),
          const Divider(height: 0, color: kDividerColor),
          TextFieldComponent(
            hint: "Password",
            isPasswordField: true,
            textController: authC.passwordController.value,
            onChanged: (String? value) {
              authC.password.value = value!;
              authC.validatePasswords();
            },
          ),
          const Divider(height: 0, color: kDividerColor),
          TextFieldComponent(
            hint: "Confirm Password",
            isPasswordField: true,
            textController: authC.confirmpPasswordController.value,
            onChanged: (String? value) {
              authC.confirmPassword.value = value!;
              authC.validatePasswords();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRoleSelection() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            activeColor: primaryColor,
            value: Roles.admin,
            groupValue: authC.selectedRole.value,
            onChanged: (String? value) {
              authC.selectedRole.value = value!;
            },
          ),
          const TextComponent('Admin', color: kGrayColor),
          const SizedBox(width: 20),
          Radio(
            activeColor: primaryColor,
            value: Roles.mechanic,
            groupValue: authC.selectedRole.value,
            onChanged: (String? value) {
              authC.selectedRole.value = value!;
            },
          ),
          const TextComponent('Mechanic', color: kGrayColor),
        ],
      );
    });
  }

  Widget _buildSignInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextComponent(
          'Already have an account? ',
          color: kGrayColor,
          padding: EdgeInsets.only(right: 5),
        ),
        TextComponent(
          'Sign In',
          color: lightPrimaryColor,
          fontWeight: titleFontWeight,
          onPressed: () {
            authC.clearValues();
            Get.offAll(() => SignInScreen(), transition: sendTransition);
          },
        ),
      ],
    );
  }
}
