import 'package:car_care/app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/booking_calendar_screen.dart';

import '../ui/screens/sign_in_screen.dart';
import '../utils/easyloading_helper.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confrimpPasswordController = TextEditingController().obs;

  // Initialize _user directly here
  final user = Rx<User?>(null);
  final selectedRole = RxString("mechanic");
  final userRole = RxString("");
  final mechanicEmail = RxString("");
  final email = RxString("");
  final password = RxString("");
  final confrimpPassword = RxString("");
  final isDisable = RxBool(false);

  getUserRoleById(String? userId) async {
    DocumentSnapshot userDoc =
        await _firestore.collection('users-with-role').doc(userId).get();
    userRole.value = userDoc['role'];
  }

  getMechanicById(String? userId) async {
    displayLoading();
    DocumentSnapshot userDoc =
        await _firestore.collection('users-with-role').doc(userId).get();

    mechanicEmail.value = userDoc['email'];
    dismissLoading();
  }

  Future<void> register() async {
    displayLoading();
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      );

      await _firestore
          .collection('users-with-role')
          .doc(userCredential.user!.uid)
          .set({
        'email': emailController.value.text,
        'role': selectedRole.value,
      });

      showMessage("Account created successfully");
      clearValues();
      Get.offAll(() => SignInScreen());
    } catch (e) {
      showMessage(e.toString(), isError: true);
    }
  }

  Future<void> signIn() async {
    displayLoading();
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text);
      showMessage("Sign In Successful");
      user.value = userCredential.user;
      getUserRoleById(userCredential.user!.uid);
      Get.offAll(() => const BookingCalendarScreen());
    } catch (e) {
      showMessage(e.toString(), isError: true);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    clearValues();
    showMessage("Logged out successfully");
    Get.offAll(() => SignInScreen(), transition: sendTransition);
  }

  void clearValues() {
    email.value="";
    password.value="";
    emailController.value.clear();
    passwordController.value.clear();
    confrimpPasswordController.value.clear();
  }

  bool disableButton() {
    return !(emailController.value.text.isEmail &&
        passwordController.value.text.isNotEmpty &&
        confrimpPasswordController.value.text.isNotEmpty &&
        selectedRole.value.isNotEmpty);
  }

  bool isLoginButtonDisable() {
    return !(email.value.isEmail && password.value.isNotEmpty);
  }
}
