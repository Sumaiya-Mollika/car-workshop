import 'package:car_care/app/ui/components/text_component.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownComponent<T> extends StatelessWidget {
  final RxList<T> items;
  final Rx<T?> selectedValue;
  final String hintText;
  final String Function(T?) getItemLabel;
  final Function(T?) onChanged;

  const DropdownComponent({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.hintText,
    required this.getItemLabel,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonFormField<T>(
          value: selectedValue.value,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: hintColor,
              fontFamily: primaryFont,
              fontSize: textSmallFontSize,
           ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16.0),
          ),
          isExpanded: true,
          onChanged: (T? newValue) {
            onChanged(newValue);
          },
          items: items.map((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: TextComponent(getItemLabel(value)),
            );
          }).toList(),
        ));
  }
}
