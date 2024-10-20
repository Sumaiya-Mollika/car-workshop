import 'package:car_care/app/ui/components/text_component.dart';
import 'package:car_care/app/ui/components/text_field_component.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:car_care/config/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/date_picker_component.dart';
import '../components/divider_component.dart';
import '../components/dropdown_component.dart';
import '../components/sadow_container_component.dart';

class BookingScreen extends StatelessWidget with Base{


  BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const TextComponent("Create Booking",fontWeight: titleFontWeight,color: kWhiteColor,),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextComponent("Car details",fontWeight: titleFontWeight,color: kTextColor,padding: EdgeInsets.symmetric(vertical: 10),),
              ShadowContainerComponent(
                Column(
                  children: [
           
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.carMake.value=value!;
                  },hint:"Car Make" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.carModel.value=value!;
                  },hint:"Car Model" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.carYear.value=value!;
                  },hint:"Car Year" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.registrationPlate.value=value!;
                  },hint:"Registration Plate" ,padding: EdgeInsets.zero,),
               
            
                 
              
               
                 
                    // SizedBox(height: 16),
                    // // DateTime pickers
                    // ElevatedButton(
                    //   onPressed: () {
                    //     showDatePicker(
                    //       context: context,
                    //       initialDate: DateTime.now(),
                    //       firstDate: DateTime(2000),
                    //       lastDate: DateTime(2101),
                    //     ).then((date) {
                    //       if (date != null) {
                    //         startDateTime = date;
                    //         endDateTime = date.add(Duration(hours: 1)); // Default 1-hour booking
                    //       }
                    //     });
                    //   },
                    //   child: Text("Select Start Date/Time"),
                    // ),
                    // SizedBox(height: 16),
                    // // Dropdown for selecting mechanic
                    // DropdownButton<String>(
                    //   value: selectedMechanic,
                    //   hint: Text("Select Mechanic"),
                    //   onChanged: (value) {
                    //     selectedMechanic = value!;
                    //   },
                    //   items: bookingC.mechanics.map((mechanic) {
                    //     return DropdownMenuItem<String>(
                    //       value: mechanic['id'], // Mechanic's Firebase user ID
                    //       child: Text(mechanic['name']),
                    //     );
                    //   }).toList(),
                    // ),
                    // SizedBox(height: 24),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     bookingController.createBooking(
                    //       // carMakeController.text,
                    //       // carModelController.text,
                    //       // carYearController.text,
                    //       // registrationPlateController.text,
                    //       // customerNameController.text,
                    //       // customerPhoneController.text,
                    //       // customerEmailController.text,
                    //       // bookingTitleController.text,
                    //       // startDateTime,
                    //       // endDateTime,
                    //       // selectedMechanic!,
                    //     );
                    //   },
                    //   child: Text("Create Booking"),å
                    // ),
                  ],
                ),
              ),
                const TextComponent("Customer Details",fontWeight: titleFontWeight,color: kTextColor,padding: EdgeInsets.symmetric(vertical: 10),),
              ShadowContainerComponent(
                      Column(
                        children: [
                          TextFieldComponent(onChanged: (String?value){
                                              bookingC.customerName.value=value!;
                                            },hint:"Customer Name" ,padding: EdgeInsets.zero,),
                                               const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.customerPhone.value=value!;
                  },hint:"Customer Phone" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.customerEmail.value=value!;
                  },hint:"Customer Email" ,padding: EdgeInsets.zero,),
                        ],
                      ),
               
                
              ),
                const TextComponent("Booking Details",fontWeight: titleFontWeight,color: kTextColor,padding: EdgeInsets.symmetric(vertical: 10),),
              ShadowContainerComponent(
                      Column(
                        children: [
                                 TextFieldComponent(onChanged: (String?value){
              bookingC.bookingTitle.value=value!;
                  },hint:"Booking Title" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                         DatePickerComponent(
                      selectedDate: bookingC.startDate,
                      hintText: "Select Start Date",
                      onDateSelected: (DateTime? date) {
                        bookingC.startDate.value = date;
                      },
                    ),
                    const DividerComponent(),
                    DatePickerComponent(
                      selectedDate: bookingC.endDate,
                      hintText: "Select End Date",
                      onDateSelected: (DateTime? date) {
                        bookingC.endDate.value = date;
                      },
                    ),
                      const DividerComponent(),
                    // DropdownComponent<String>(
                    //   items: bookingC.mechanics,
                    //   selectedValue: bookingC.selectedMechanic,
                    //   hintText: "Assign Mechanic",
                    //   getItemLabel: (mechanic) => mechanic ?? "",
                    //   onChanged: (String? value) {
                    //     bookingC.selectedMechanic.value = value;
                    //   },
                    // ),
                        ],
                      ),
               
                
              )
            ],
          ),
        ),
      ),
    );
  }
}


