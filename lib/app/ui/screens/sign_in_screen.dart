
import 'package:car_care/app/ui/components/button_component.dart';
import 'package:car_care/app/ui/components/text_field_component.dart';
import 'package:car_care/app/ui/components/text_component.dart';
import 'package:car_care/app/ui/screens/sign_up_screen.dart';
import 'package:car_care/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/base.dart';
import '../../../gen/assets.gen.dart';


class SignInScreen extends StatelessWidget with Base{
 SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:Container(
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
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                            const BoxShadow(color: Color.fromRGBO(143, 148, 251, .2), blurRadius: 20.0, offset: Offset(0, 10))
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
                            
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ButtonComponent(text:"Sign In",onPressed: (){},),
                     Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextComponent(
                              'Don\'t have an account? ',
                             color:kGrayColor,
                             padding: EdgeInsets.only(right: 5),
                            ),
                         
                            TextComponent('Sign Up',color: lightPrimaryColor,fontWeight: titleFontWeight,onPressed: (){
                              Get.offAll(()=>SignUpScreen());
                            },),
                          ],
                        ),
                     
               
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