import 'package:flutter/material.dart';

class AppColors {
  //device
  static Color transparent = Colors.transparent;
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color black = Colors.black;
  static Color color21 = const Color(0xff212121);
  static Color colorFA = const Color(0xfffafafa);
  static Color color9E = const Color(0xff9E9E9E);
  static Color orange = Color(0xffEFAA20);


  // Primary
  static Color prymary = const Color(0xff075BA9);
  static Color gray = const Color(0xffe0e0e0);

  static LinearGradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xff1788EF),
        prymary,
      ]);
  static LinearGradient disableGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xff1788EF).withOpacity(0.5),
        prymary.withOpacity(0.5),
      ]);
}
