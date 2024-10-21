import 'package:car_care/app/ui/components/button_component.dart';
import 'package:car_care/app/ui/components/text_component.dart';
import 'package:car_care/app/ui/components/text_field_component.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:car_care/config/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_with_role_model.dart';
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
        
   
        title: const TextComponent("Create Booking",fontWeight: titleFontWeight,color: kWhiteColor,),),
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
                  },hint:"Made By" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.carModel.value=value!;
                  },hint:"Model" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.carYear.value=value!;
                  },hint:"Year" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.registrationPlate.value=value!;
                  },hint:"Registration Plate" ,padding: EdgeInsets.zero,),
               
                  ],
                ),
              ),
                const TextComponent("Customer Details",fontWeight: titleFontWeight,color: kTextColor,padding: EdgeInsets.symmetric(vertical: 10),),
              ShadowContainerComponent(
                      Column(
                        children: [
                          TextFieldComponent(onChanged: (String?value){
                                              bookingC.customerName.value=value!;
                                            },hint:"Name" ,padding: EdgeInsets.zero,),
                                               const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.customerPhone.value=value!;
                  },hint:"Phone" ,padding: EdgeInsets.zero,),
                  const DividerComponent(),
                  TextFieldComponent(onChanged: (String?value){
                    bookingC.customerEmail.value=value!;
                  },hint:"Email" ,padding: EdgeInsets.zero,),
                        ],
                      ),
               
                
              ),
                const TextComponent("Booking Details",fontWeight: titleFontWeight,color: kTextColor,padding: EdgeInsets.symmetric(vertical: 10),),
              ShadowContainerComponent(
                      Column(
                        children: [
                                 TextFieldComponent(onChanged: (String?value){
              bookingC.bookingTitle.value=value!;
                  },hint:"Title" ,padding: EdgeInsets.zero,),
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
                    DropdownComponent<UserWithRole>(
                      items: bookingC.mechanics,
                      selectedValue: bookingC.selectedMechanic,
                      hintText: "Assign Mechanic",
                      getItemLabel: (mechanic) => mechanic!.name ,
                      onChanged: (UserWithRole? value) {
                         //bookingC.  fetchMechanics(); 
                        bookingC.selectedMechanic.value = value;
                      },
                    ),
                        ],
                      ),
               
                
              ),
          
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Obx(
       ()=> ButtonComponent(
        padding: const EdgeInsets.symmetric(horizontal:50),
            cancelButton:bookingC. disableBookingButton(),
            text: "Create Booking",
            onPressed: (){
               bookingC.createBooking();
            }),
        )
      ],
    );
  }
}


