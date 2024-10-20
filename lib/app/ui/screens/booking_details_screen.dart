import 'package:car_care/app/ui/components/sadow_container_component.dart';
import 'package:car_care/app/ui/components/text_component.dart';
import 'package:flutter/material.dart';
import '../../models/booking_model.dart';
import '../../utils/style.dart';


class BookingDetailsScreen extends StatelessWidget {
  final Booking booking;

  const BookingDetailsScreen(this.booking, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextComponent('Booking Details',fontWeight: titleFontWeight,color: kWhiteColor,)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadowContainerComponent(TextComponent('Booking Title: ${booking.bookingTitle}',padding: EdgeInsets.symmetric(horizontal: 6,vertical: 10),)),
            const SizedBox(height: 10),
            TextComponent('Car Make: ${booking.carMake}'),
            TextComponent('Car Model: ${booking.carModel}'),
            TextComponent('Car Year: ${booking.carYear}'),
            TextComponent('Customer Name: ${booking.customerName}'),
            TextComponent('Customer Phone: ${booking.customerPhone}'),
            TextComponent('Customer Email: ${booking.customerEmail}'),
            const SizedBox(height: 20),
            TextComponent('Booking Time: ${booking.startDateTime} - ${booking.endDateTime}',textAlign: TextAlign.start,),
            TextComponent('Assigned Mechanic ID: ${booking.mechanicId}',textAlign: TextAlign.start,),  // Mechanic's ID, you can fetch mechanic's name if stored
          ],
        ),
      ),
    );
  }
}
