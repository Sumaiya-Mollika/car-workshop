import 'package:car_care/app/ui/components/button_component.dart';

import 'package:car_care/app/ui/components/text_field_component.dart';
import 'package:car_care/app/ui/screens/sign_in_screen.dart';
import 'package:car_care/app/utils/constants.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:car_care/config/base.dart';
import 'package:car_care/gen/assets.gen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


class SignUpScreen extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    // authC.clearValue();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration:
                        BoxDecoration(image: DecorationImage(image: AssetImage(Assets.images.background.path), fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.images.light1.path))),
                          ),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.images.light2.path))),
                          ),
                        ),
                    
                   
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      children:[
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                            BoxShadow(color: Color.fromRGBO(143, 148, 251, .2), blurRadius: 20.0, offset: Offset(0, 10))
                          ]),
                          child: Column(
                            children: [
                
                            TextFieldComponent(
                             
                                hint: "Email",
                                onChanged: (v){},
                              textController: authC.emailController,),
                                const Divider(height: 0,color: kDividerColor,),
                            TextFieldComponent(
                             isPasswordField: true,
                                hint: "Password",
                                onChanged: (v){},
                              textController: authC.passwordController,),
                                const Divider(height: 0,color: kDividerColor,),
                            TextFieldComponent(
                              isPasswordField: true,
                                hint: "Confrim Password",
                                onChanged: (v){},
                              textController: authC.confrimpPasswordController,),
                   
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ButtonComponent(
                           //  cancelButton:!authC.disableButton(),
                              text:"Sign Up",onPressed: (){
                              authC.register();
                            },),
                         
                        // GestureDetector(
                        //   onTap: () => authC.isSubmitButtonValid() ? authC.signUp(authC.email.value, authC.password.value) : null,
                        //   child: Container(
                        //     height: 50,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         //  Colors.amber.withOpacity(authC.isSubmitButtonValid() ? 1 : .6),
                        //         gradient: LinearGradient(colors: [
                        //           authC.isSubmitButtonValid() ? Color.fromRGBO(143, 148, 251, 1) : Colors.grey.shade100,
                        //           authC.isSubmitButtonValid() ? Color.fromRGBO(143, 148, 251, .6) : Colors.grey.shade100,
                        //         ])),
                        //     child: Center(
                        //       child: authC.loading.value
                        //           ? Loading(
                        //               color: Colors.white,
                        //             )
                        //           : Text(
                        //               "Sign Up",
                        //               style: TextStyle(
                        //                   color: authC.isSubmitButtonValid() ? Colors.white : Colors.grey,
                        //                   fontWeight: FontWeight.bold),
                        //             ),
                        //     ),
                        //   ),
                        // ),
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offAll( ()=>SignInScreen(),transition: sendTransition);
                              //  authC.clearValue();
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            
          ),
        ));
  }


}