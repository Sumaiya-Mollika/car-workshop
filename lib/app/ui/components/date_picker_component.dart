import 'package:car_care/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerComponent extends StatelessWidget {
  final Rx<DateTime?> selectedDate;
  final String hintText;
  final Function(DateTime?) onDateSelected;

  const DatePickerComponent({
    super.key,
    required this.selectedDate,
    required this.hintText,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate.value ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
      child: Obx(() => TextField(
        enabled: false,
            decoration: InputDecoration(
              hintText: selectedDate.value == null
                  ? hintText
                  : selectedDate.value!.toLocal().toString().split(' ')[0],
              border:InputBorder.none,
              //border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(10),
              suffixIcon: Icon(Icons.calendar_month,color: primaryColor,)
            ),
            
          )),
    );
  }
}
