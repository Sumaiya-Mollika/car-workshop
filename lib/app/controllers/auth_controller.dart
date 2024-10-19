import 'package:car_care/app/ui/screens/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/easyloading_helper.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confrimpPasswordController = TextEditingController();
late Rx<User?> _user;
  final userRole =RxString(""); 
  final isObscure =RxBool(false);
  @override
  void onInit() {
    super.onInit();
   // _user.bindStream(_auth.authStateChanges());
  }
  // @override
  // void onReady() {
  //   super.onReady();
  //   _user = Rx<User?>(_auth.currentUser);
  //   _user.bindStream(_auth.userChanges());
  //   ever(_user, _initaialPage);
  // }

  _initaialPage(User? user) {
    if (user == null) {
      Get.offAll(()=> SignInScreen());
    } else {
     // Get.offAll(HomeScreen());
    }
  }
 // Registration
//   Future<void> register(String email, String password, String role) async {
//     displayLoading();
//     try {
//       // Create the user in Firebase Auth
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
      
//       // Save the user's role in Firestore
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'email': email,
//         'role': role,  // Save the role (admin or mechanic)
//       });
// dismissLoading();
//       Get.snackbar("Success", "Account created successfully");
//       // Redirect to a suitable page (home or dashboard) after registration
//     } catch (e) {
//       dismissLoading();
//       Get.snackbar("Error", e.toString());
//     }
//   }

  // Login
  // Future<void> signIn(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     customSnackbar(title: 'Sign In Successful', message: '', color: Colors.green);
  //     // Navigate to home or dashboard
  //   } catch (e) {
  //     _handleAuthError(e);
  //   }
  // }

  // Error handling
  // void _handleAuthError(dynamic error) {
  //   String errorMessage = extractErrorMessage(error.toString());
  //   customSnackbar(title: 'Authentication Failed', message: errorMessage, color: Colors.red);
  // }

  Future<void> logout() async {
    await _auth.signOut();
    Get.snackbar("Success", "Logged out successfully");
  }
}
