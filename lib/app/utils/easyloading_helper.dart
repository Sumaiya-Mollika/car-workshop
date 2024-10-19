  import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void closeSoftKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
void displayLoading({var value = "Please wait...", bool isHideKeyboard = true}) {
    if (isHideKeyboard) closeSoftKeyBoard();
    EasyLoading.show(status: value);
  }

  void dismissLoading() {
    EasyLoading.dismiss();
  }

  void showMessage(String? value, {bool isError = false, bool isInfo = false}) {
    if (isError) {
      dismissLoading();
      EasyLoading.showError("$value");
    } else if (isInfo) {
      EasyLoading.showInfo("$value");
    } else {
      EasyLoading.showSuccess("$value");
    }
  }

  // void handleErrorResponse(ParseResponse? errorResponse,
  //     {bool isShowError = true}) {
  //   if (isShowError) {
  //     showMessage(errorResponse?.error?.message, isError: true);
  //   }

  //   if (errorResponse?.statusCode == 209) {
  //     // 209: 'InvalidSessionToken',
  //     logoutUser();
  //   }
 // }
