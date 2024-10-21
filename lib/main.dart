import 'dart:developer';

import 'package:car_care/app/controllers/auth_controller.dart';
import 'package:car_care/app/utils/easyloading_helper.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:car_care/config/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'app/ui/screens/splash_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
initializeFirebase();
  
  runApp(const MyApp());
}
Future<void> initializeFirebase() async {
  try {
         await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthController()));

  } catch (e) {
    if (kDebugMode) {
      log('Error initializing Firebase: $e');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'Car Workshop App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: true,
         iconTheme: IconThemeData(
          color: kWhiteColor
        ),
        ),
       
dividerTheme: const DividerThemeData(
  color: Colors.transparent
),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
           builder: (context, child) {
        return GestureDetector(
          onTap: () {
           
            closeSoftKeyBoard();
          },
         
          child: FlutterEasyLoading(child: child!),
        );
      },
    );
  }
}

