import 'package:car_care/app/utils/style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class TextFieldComponent extends StatefulWidget {
  final String? hint;

  final TextInputAction? textInputAction;
  final Function(String? value) onChanged;

  final double? fontSize;
  final Color textFontColor;
  final String font;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final bool isFullValidate;
  final Widget? suffixIcon;
 final bool isPasswordField;
  final Color? prefixIconColor;
  final bool isRemoveBottomBorder;
  final InputBorder? inputDecorationBorder;
  final FloatingLabelBehavior? floatingLabelBehavior;
    final TextEditingController? textController;
  const TextFieldComponent({
    super.key,
    this.hint,
 
    this.suffixIcon,

    required this.onChanged,
    this.isFullValidate = true,
    this.isPasswordField=false,
    this.fontSize = textSmallFontSize,
    this.font = primaryFont,
    this.fontWeight = mediumFontWeight,
    this.textFontColor = kTextColor,
    this.prefixIconColor = primaryColor,
    this.textInputAction = TextInputAction.done,
    this.isRemoveBottomBorder = true,
    this.inputDecorationBorder,
    this.floatingLabelBehavior,
    this.padding = const  EdgeInsets.all(8.0),
    this.textController,
  });

  @override
  _TextFieldComponentState createState() =>
      _TextFieldComponentState();
}

class _TextFieldComponentState
    extends State<TextFieldComponent> {
  bool _fieldVisibility = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:widget. padding,
      child: TextFormField(
           controller:widget. textController,
       autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          widget.onChanged(value);
        },
      
        style: GoogleFonts.getFont(
          widget.font,
          fontWeight: widget.fontWeight,
          color: widget.textFontColor,
          fontSize: widget.fontSize,
        ),
          
          
        obscureText: _fieldVisibility,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          
          hintText: widget.hint ?? "",
          hintStyle: const TextStyle(
              color: hintColor,
              fontFamily: primaryFont,
              fontSize: textSmallFontSize,
           ),
        
          errorMaxLines: 3,
          border: InputBorder.none,
      
          suffixIcon:widget.isPasswordField==true? GestureDetector(
              onTap: () {
                setState(() {
                  _fieldVisibility = !_fieldVisibility;
                });
              },
              child:
                  Icon( _fieldVisibility? EvaIcons.eyeOffOutline:EvaIcons.eyeOutline, color: lightPrimaryColor)
               ):null,
        ),
      ),
    );
  }
}

