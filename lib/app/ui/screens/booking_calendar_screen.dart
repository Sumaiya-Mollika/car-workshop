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


class BookingCalendarScreen extends StatefulWidget {
  const BookingCalendarScreen({super.key});

  @override
  State<BookingCalendarScreen> createState() => _BookingCalendarScreenState();
}

class _BookingCalendarScreenState extends State<BookingCalendarScreen>with Base {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  


  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    if (authC.userRole.value == 'mechanic') {
  bookingC.fetchMechanicBookings(authC.user.value!.uid);  
} else {
  bookingC.fetchBookings();  
}
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextComponent('Bookings Calendar',fontWeight: titleFontWeight,color: kWhiteColor,),actions: [
          IconButton(onPressed: (){
            authC.logout();
          }, icon: const Icon(Icons.logout,color: kWhiteColor,))
        ],),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
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
          Expanded(
            child: Obx(() {
              if (bookingC.filteredBookings.isEmpty) {
                return const Center(child: TextComponent('No bookings for this day'));
              } else {
                return ListView.builder(
                  itemCount: bookingC.filteredBookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookingC.filteredBookings[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: ShadowContainerComponent(
                       ListTile(
                          title: TextComponent(booking.bookingTitle,textAlign: TextAlign.start,),
                          subtitle: TextComponent('${booking.startDateTime} - ${booking.endDateTime}',textAlign: TextAlign.start),
                          onTap: () {
                            Get.to(() => BookingDetailsScreen(booking),transition: sendTransition);
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
       ()=>   authC.userRole.value == 'admin'?   ButtonComponent(
             padding: const EdgeInsets.symmetric(horizontal:50),
          onPressed: (){
        
          Get.to(()=>BookingScreen(),transition: sendTransition);
        },text:"Create Booking" ,):const SizedBox(),
      )],
     
    );
  }
}
