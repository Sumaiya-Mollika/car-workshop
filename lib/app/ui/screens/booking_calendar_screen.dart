import 'package:car_care/app/ui/components/button_component.dart';
import 'package:car_care/app/ui/components/sadow_container_component.dart';
import 'package:car_care/app/ui/components/text_component.dart';
import 'package:car_care/app/ui/screens/booking_details_screen.dart';
import 'package:car_care/app/ui/screens/booking_screen.dart';
import 'package:car_care/app/utils/constants.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:car_care/config/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/utils.dart';

class BookingCalendarScreen extends StatefulWidget {
  const BookingCalendarScreen({super.key});

  @override
  State<BookingCalendarScreen> createState() => _BookingCalendarScreenState();
}

class _BookingCalendarScreenState extends State<BookingCalendarScreen>
    with Base {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    bookingC.selectedDay.value = bookingC.focusedDay.value;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const TextComponent(
            'Bookings Calendar',
            fontWeight: titleFontWeight,
            color: kWhiteColor,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  authC.logout();
                },
                icon: const Icon(
                  Icons.logout,
                  color: kWhiteColor,
                ))
          ],
        ),
        body: Column(
          children: [
            Obx(
              () => TableCalendar(
                focusedDay: bookingC.focusedDay.value!,
                firstDay: DateTime(2020, 1, 1),
                lastDay: DateTime(2030, 12, 31),
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(bookingC.selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  bookingC.selectedDay.value = selectedDay;
                  bookingC.focusedDay.value = focusedDay;

                  bookingC.filterBookingsByDate(selectedDay);
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                eventLoader: (day) {
                  return bookingC.getBookingsForDay(day);
                },
              ),
            ),
            Expanded(
              child: Obx(() {
                if (bookingC.filteredBookings.isEmpty) {
                  return const Center(
                      child: TextComponent('No bookings for this day'));
                } else {
                  return ListView.builder(
                    itemCount: bookingC.filteredBookings.length,
                    itemBuilder: (context, index) {
                      final booking = bookingC.filteredBookings[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: ShadowContainerComponent(
                          ListTile(
                            title: TextComponent(
                              booking.bookingTitle,
                              textAlign: TextAlign.center,
                              fontSize: k24heightValue,
                            ),
                            subtitle: TextComponent(
                              '${formatDateTime(booking.startDateTime)} - ${formatDateTime(booking.endDateTime)}',
                              textAlign: TextAlign.center,
                              fontSize: k12FontSize,
                              padding: const EdgeInsets.only(top: 8),
                            ),
                            onTap: () {
                              authC.getMechanicById(booking.mechanicId);
                              Get.to(() => BookingDetailsScreen(booking),
                                  transition: sendTransition);
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
        persistentFooterButtons: [
          Obx(
            () => authC.userRole.value == 'admin'
                ? ButtonComponent(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    onPressed: () {
                      bookingC.fetchMechanics();
                      Get.to(() => BookingScreen(), transition: sendTransition);
                    },
                    text: "Create Booking",
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
