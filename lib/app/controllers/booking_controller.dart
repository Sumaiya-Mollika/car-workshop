import 'dart:developer';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_model.dart';


class BookingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final bookingTitle=RxString("");
  final carMake=RxString("");
  final carModel=RxString("");
  final carYear=RxString("");
  final registrationPlate=RxString("");
  final customerName=RxString("");
  final customerPhone=RxString("");
  final customerEmail=RxString("");
final mechanics = RxList([]);  

final startDate=Rx<DateTime?> (null);
final endDate=Rx<DateTime?> (null);
  @override
  void onInit() {
    super.onInit();
    fetchMechanics();  // Load mechanics when controller is initialized
  }

  // Fetch mechanics from Firestore
  void fetchMechanics() {
    _firestore.collection('users').where('role', isEqualTo: 'mechanic').get().then((querySnapshot) {
      mechanics.value = querySnapshot.docs.map((doc) {
        return {'id': doc.id, 'name': doc['email']};  // Use email as name for now
      }).toList();
    });

    log(mechanics.toJson().toString());
  }

  // Create a new booking in Firestore
  Future<void> createBooking(
    String carMake,
    String carModel,
    String carYear,
    String registrationPlate,
    String customerName,
    String customerPhone,
    String customerEmail,
    String bookingTitle,
    DateTime startDateTime,
    DateTime endDateTime,
    String mechanicId,
  ) async {
    try {
      // Generate a new document ID
      String bookingId = _firestore.collection('bookings').doc().id;

      // Create a Booking object
      Booking newBooking = Booking(
        id: bookingId,
        carMake: carMake,
        carModel: carModel,
        carYear: carYear,
        registrationPlate: registrationPlate,
        customerName: customerName,
        customerPhone: customerPhone,
        customerEmail: customerEmail,
        bookingTitle: bookingTitle,
        startDateTime: startDateTime,
        endDateTime: endDateTime,
        mechanicId: mechanicId,
      );

      // Save the booking to Firestore
      await _firestore.collection('bookings').doc(bookingId).set(newBooking.toMap());

      Get.snackbar("Success", "Booking created successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to create booking: $e");
    }
  }
}
