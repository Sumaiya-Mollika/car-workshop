import 'dart:developer';

import 'package:car_care/app/ui/screens/booking_calendar_screen.dart';
import 'package:car_care/app/utils/constants.dart';
import 'package:car_care/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/booking_model.dart';
import '../models/user_with_role_model.dart';

class BookingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final bookingTitle = RxString("");
  final carMake = RxString("");
  final carModel = RxString("");
  final carYear = RxString("");
  final registrationPlate = RxString("");
  final customerName = RxString("");
  final customerPhone = RxString("");
  final customerEmail = RxString("");
  final mechanics = RxList<UserWithRole>([]);
  final allBookings = RxList<Booking>([]);
  final filteredBookings = RxList<Booking>([]);
  final eventLoaderBookings = RxList<Booking>([]);
  final selectedMechanic = Rx<UserWithRole?>(null);
  final startDate = Rx<DateTime?>(null);
  final endDate = Rx<DateTime?>(null);

  final focusedDay = Rx<DateTime?>(DateTime.now());
  final selectedDay = Rx<DateTime?>(null);

  void fetchMechanics() {
    mechanics.clear();
    selectedMechanic.value = null;
    _firestore
        .collection(Collections.userWithRole)
        .where('role', isEqualTo: Roles.mechanic)
        .get()
        .then((querySnapshot) {
      mechanics.value = querySnapshot.docs.map((doc) {
        return UserWithRole.fromJson(doc.data(), doc.id);
      }).toList();
    }).catchError((error) {
      log('Error fetching mechanics: $error');
    });
  }

  Future<void> createBooking() async {
    displayLoading();
    try {
      String bookingId = _firestore.collection(Collections.bookings).doc().id;

      Booking newBooking = Booking(
        id: bookingId,
        carMake: carMake.value,
        carModel: carModel.value,
        carYear: carYear.value,
        registrationPlate: registrationPlate.value,
        customerName: customerName.value,
        customerPhone: customerPhone.value,
        customerEmail: customerEmail.value,
        bookingTitle: bookingTitle.value,
        startDateTime: startDate.value!,
        endDateTime: endDate.value!,
        mechanicId: selectedMechanic.value!.id,
      );

      await _firestore
          .collection(Collections.bookings)
          .doc(bookingId)
          .set(newBooking.toMap());
      showMessage("Booking created successfully!");
      fetchBookings();
    } catch (e) {
      showMessage("Failed to create booking: $e", isError: true);
    }
  }

  bool disableBookingButton() {
    if (carMake.value.isNotEmpty &&
        carModel.value.isNotEmpty &&
        carYear.value.isNotEmpty &&
        registrationPlate.value.isNotEmpty &&
        customerName.value.isNotEmpty &&
        customerPhone.value.isNotEmpty &&
        customerEmail.value.isEmail &&
        bookingTitle.value.isNotEmpty &&
        startDate.value != null &&
        endDate.value != null &&
        selectedMechanic.value != null) {
      return false;
    } else {
      return true;
    }
  }

  void fetchBookings() {
    displayLoading();

    _firestore.collection(Collections.bookings).snapshots().listen((snapshot) {
      var bookings = snapshot.docs.map((doc) {
        return Booking.fromMap(doc.data(), doc.id);
      }).toList();
      dismissLoading();
      allBookings.value = bookings;

      filterBookingsByDate(focusedDay.value!);
      Get.to(() => const BookingCalendarScreen());
    }, onError: (error) {
      showMessage(error, isError: true);
    });
  }

  void filterBookingsByDate(DateTime selectedDay) {
    filteredBookings.clear();
    filteredBookings.value = allBookings.where((booking) {
      return isSameDay(booking.startDateTime, selectedDay); // Filter by date
    }).toList();
  }

  List<Booking> getBookingsForDay(DateTime day) {
    return allBookings.where((booking) {
      return isSameDay(booking.startDateTime, day);
    }).toList();
  }

  void fetchMechanicBookings(String mechanicId) {
    allBookings.clear();
    _firestore
        .collection(Collections.bookings)
        .where('mechanicId', isEqualTo: mechanicId)
        .snapshots()
        .listen((snapshot) {
      var bookings = snapshot.docs.map((doc) {
        return Booking.fromMap(doc.data(), doc.id);
      }).toList();
      allBookings.value = bookings;
      filterBookingsByDate(focusedDay.value!);
      Get.to(() => const BookingCalendarScreen());
    });
  }
}
