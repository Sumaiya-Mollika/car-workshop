import 'package:get/get.dart';

import '../app/controllers/auth_controller.dart';
import '../app/controllers/booking_controller.dart';

mixin class Base {
  final authC = Get.put(AuthController());
  final bookingC = Get.put(BookingController());
}
