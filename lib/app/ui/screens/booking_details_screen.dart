import 'package:car_care/app/ui/components/divider_component.dart';
import 'package:car_care/app/ui/components/sadow_container_component.dart';
import 'package:car_care/app/ui/components/text_component.dart';
import 'package:car_care/config/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/booking_model.dart';
import '../../utils/style.dart';
import '../../utils/utils.dart';

class BookingDetailsScreen extends StatelessWidget with Base {
  final Booking booking;

  BookingDetailsScreen(this.booking, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TextComponent(
        'Booking Details',
        fontWeight: titleFontWeight,
        color: kWhiteColor,
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadowContainerComponent(Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TextComponent(
                      booking.bookingTitle,
                      textAlign: TextAlign.center,
                      fontSize: titleFontSize,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const DividerComponent(),
                  const SizedBox(height: 10),
                  const TextComponent(
                    "Car details",
                    fontWeight: titleFontWeight,
                    color: kTextColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  TextComponent('Made By: ${booking.carMake}'),
                  TextComponent('Model: ${booking.carModel}'),
                  TextComponent('Year: ${booking.carYear}'),
                  const TextComponent(
                    "Customer Details",
                    fontWeight: titleFontWeight,
                    color: kTextColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  TextComponent('Name: ${booking.customerName}'),
                  TextComponent('Phone: ${booking.customerPhone}'),
                  TextComponent('Email: ${booking.customerEmail}'),
                  const TextComponent(
                    "Booking Details",
                    fontWeight: titleFontWeight,
                    color: kTextColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  TextComponent(
                    'Time: ${formatDateTime(booking.startDateTime)} - ${formatDateTime(booking.endDateTime)}',
                    textAlign: TextAlign.start,
                  ),
                  Obx(
                    () => TextComponent(
                      'Assigned Mechanic : ${authC.mechanicEmail.value}',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
