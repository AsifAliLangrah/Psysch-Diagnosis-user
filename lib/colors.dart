import 'package:flutter/material.dart';
var buttonColor = Color(0xff3F48CC);
var appbarStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);
var buttonText =
TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
void openScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

void openScreenAndCloseOthers(BuildContext context, Widget screen) {
  Navigator.popUntil(context, (route) => false);
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

var questionStyle = TextStyle(

  fontSize: 15,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);
var dacuration = BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.60),
        offset: Offset(5, 5),
        blurRadius: 10,
        spreadRadius: -5),
  ],
);
var textFieldStyle =TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff909090),
);