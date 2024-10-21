import 'package:car_care/gen/assets.gen.dart';
import 'package:flutter/material.dart';

Widget positionedComponent(
    double left, double width, double height, String assetPath) {
  return Positioned(
    left: left,
    width: width,
    height: height,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(assetPath)),
      ),
    ),
  );
}

BoxDecoration buildBackgroundDecoration() {
  return BoxDecoration(
    color: Colors.white,
    image: DecorationImage(
      image: AssetImage(Assets.images.background.path),
      fit: BoxFit.fill,
    ),
  );
}

Widget buildAuthBackground() {
  return Container(
    height: 400,
    decoration: buildBackgroundDecoration(),
    child: Stack(
      children: [
        positionedComponent(30, 80, 200, Assets.images.light1.path),
        positionedComponent(140, 80, 150, Assets.images.light2.path),
      ],
    ),
  );
}
