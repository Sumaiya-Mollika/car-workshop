import 'package:get/get.dart';

import '../app/controllers/auth_controller.dart';

mixin class Base {
  final authC = Get.put(AuthController());

}