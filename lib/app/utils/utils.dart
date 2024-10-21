import 'package:car_care/app/utils/constants.dart';
import 'package:intl/intl.dart';

/// Formats a DateTime object into a readable date string.
String formatDateTime(DateTime dateTime) {
  final DateFormat outputFormat = DateFormat(kDateFormat);
  return outputFormat.format(dateTime);
}
