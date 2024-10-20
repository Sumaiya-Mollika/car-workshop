import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/booking_screen.dart';
import '../ui/screens/sign_in_screen.dart';
import '../utils/easyloading_helper.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confrimpPasswordController = TextEditingController().obs;

  // Initialize _user directly here
  Rx<User?> _user = Rx<User?>(null);
  final selectedRole = RxString("mechanic"); 
  final isDisable = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    // Bind the auth state changes stream
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
    // Bind user changes
    _user.bindStream(_auth.userChanges());
    // React to user changes
    ever(_user, _initaialPage);
  }

  void _initaialPage(User? user) {
    if (user == null) {
      Get.offAll(() => SignInScreen());
    } else {
      Get.offAll(() => BookingScreen());
      
    }
  }

  Future<void> register() async {
    displayLoading();
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      );

      await _firestore.collection('users-with-role').doc(userCredential.user!.uid).set({
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
      await _auth.signInWithEmailAndPassword(
        email: emailController.value.text, 
        password: passwordController.value.text
      );
      showMessage("Sign In Successful");
    } catch (e) {
      showMessage(e.toString(), isError: true);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.snackbar("Success", "Logged out successfully");
  }

  void clearValues() {
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
}
