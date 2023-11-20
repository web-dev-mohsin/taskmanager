
import 'package:flutter/material.dart';


import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

TextStyle heading1Text(textColor){
  return TextStyle(
    color: textColor,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    fontFamily: 'poppins',
  );
}

TextStyle heading6Text(textColor){
  return TextStyle(
    color: textColor,
    fontFamily: 'poppins',
    fontSize: 16,
    fontWeight: FontWeight.w400
  );
}

InputDecoration appInputDecoration(label){
  return InputDecoration(

    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.green, width: 1),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    enabledBorder:  OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.white, width: 2),
    ),
    focusColor: Colors.red,
    border: OutlineInputBorder(),
    labelText: label,
    filled: true,
    fillColor: Colors.white,

  );
}

DecoratedBox appDropDownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),),
    child: Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
  );
}

SvgPicture screenBackground(context){
  return SvgPicture.asset(
     "assets/images/background.svg",
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,

  );
}

ButtonStyle appButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))

  );
}

TextStyle buttonTextStyle(){
  return TextStyle(

    fontSize: 14,
    color: Colors.white,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

Ink successButtonChild(String ButtonText){
  return Ink(
    decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText, style: buttonTextStyle(),),
    ),
  );
}

// void successToast(msg){
//   Fluttertoast.showToast(
//     msg: msg,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     toastLength: Toast.LENGTH_SHORT,
//     backgroundColor: Colors.green,
//     textColor: Colors.white,
//     fontSize: 16,
//
//   );
//
// }void errorToast(msg){
//   Fluttertoast.showToast(
//     msg: msg,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     toastLength: Toast.LENGTH_SHORT,
//     backgroundColor: Colors.red,
//     textColor: Colors.white,
//     fontSize: 16,
//
//   );
// }

PinTheme appOTPStyle(){
  return PinTheme(
    inactiveColor: Colors.white70,
    inactiveFillColor: Colors.white,
    selectedColor: Colors.green,
    selectedFillColor: Colors.green,
    activeColor: Colors.white,
    activeFillColor: Colors.white,
    fieldHeight: 40,
    borderWidth: 0.5,

  );
}


