class Booking {
  final String id;
  final String carMake;
  final String carModel;
  final String carYear;
  final String registrationPlate;
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final String bookingTitle;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final String mechanicId; 

  Booking({
    required this.id,
    required this.carMake,
    required this.carModel,
    required this.carYear,
    required this.registrationPlate,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    required this.bookingTitle,
    required this.startDateTime,
    required this.endDateTime,
    required this.mechanicId,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'carMake': carMake,
      'carModel': carModel,
      'carYear': carYear,
      'registrationPlate': registrationPlate,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'customerEmail': customerEmail,
      'bookingTitle': bookingTitle,
      'startDateTime': startDateTime.toIso8601String(),
      'endDateTime': endDateTime.toIso8601String(),
      'mechanicId': mechanicId,
    };
  }


  static Booking fromMap(Map<String, dynamic> map, String id) {
    return Booking(
      id: map['id'],
      carMake: map['carMake'],
      carModel: map['carModel'],
      carYear: map['carYear'],
      registrationPlate: map['registrationPlate'],
      customerName: map['customerName'],
      customerPhone: map['customerPhone'],
      customerEmail: map['customerEmail'],
      bookingTitle: map['bookingTitle'],
      startDateTime: DateTime.parse(map['startDateTime']),
      endDateTime: DateTime.parse(map['endDateTime']),
      mechanicId: map['mechanicId'],
    );
  }
}
