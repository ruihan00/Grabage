import 'package:flutter/material.dart';

const MaterialColor redBase = MaterialColor(
  0xFFEB8181,
  <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xFFEB8181),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  },
);

const Color mainColor = Color(0xFFFDF5E6);
const Color titleColor = Color(0xFF3B3B3B);
const Color red = Color(0xFFdc5445);
const Color yellow = Color(0xFFffdc81);
const Color cream = Color(0xFFfff9f6);
const Color green = Color(0xffa2c954);

const LinearGradient loginBackground = LinearGradient(
  colors: <Color>[Color(0xffc8dda4), Color(0xff93bc3f)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const LinearGradient prideExperienceGradient =
LinearGradient(colors: <Color>[Color(0xffDC5445), Color(0xffFFDC81)]);

const signupTextFieldDecoration = InputDecoration(
  filled: true,
  // fillColor: Colors.white,
  // hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),

  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff93bc3f), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFdc5445), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
