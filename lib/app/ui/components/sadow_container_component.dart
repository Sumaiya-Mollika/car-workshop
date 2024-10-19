
import 'package:flutter/material.dart';


class ShadowContainerComponent extends StatelessWidget {
  final Widget childWidget;

  const ShadowContainerComponent(
    this.childWidget, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(143, 148, 251, .2),
            blurRadius: 20.0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: childWidget,
    );
  }
}
