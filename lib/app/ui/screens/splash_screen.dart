import 'package:car_care/app/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(()=>SignInScreen()); // Assuming '/login' is the route for the login screen
    });
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: _buildBackgroundDecoration(),
        child: Stack(
          children: <Widget>[
            _buildLightImage(0.08, 0.21, 0.25, Assets.images.light1.path),
            _buildLightImage(0.37, 0.21, 0.19, Assets.images.light2.path),
        
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundDecoration() {
    return BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage(Assets.images.background.path),
        fit: BoxFit.fill,
      ),
    );
  }

  Positioned _buildLightImage(double leftFactor, double widthFactor, double heightFactor, String imagePath) {
    return Positioned(
      left: Get.width * leftFactor,
      width: Get.width * widthFactor,
      height: Get.height * heightFactor,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }


}
