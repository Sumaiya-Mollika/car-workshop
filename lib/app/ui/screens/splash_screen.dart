import 'package:car_care/app/ui/components/auth_background_component.dart';
import 'package:car_care/app/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => SignInScreen());
    });
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: buildBackgroundDecoration(),
        child: Stack(
          children: <Widget>[
            positionedComponent(Get.width * 0.08, Get.width * 0.21,
                Get.height * 0.25, Assets.images.light1.path),
            positionedComponent(Get.width * 0.37, Get.width * 0.21,
                Get.height * 0.19, Assets.images.light2.path),
          ],
        ),
      ),
    );
  }
}
