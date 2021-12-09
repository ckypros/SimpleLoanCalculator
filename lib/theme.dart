import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.deepOrange,
  fontFamily: 'Montserrat',
  brightness: Brightness.light,
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontSize: null,
      fontWeight: FontWeight.w400,
      color: Color(0xddAA0000),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF34a0a4),
    foregroundColor: Colors.white70,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 90,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: Color(0xff000000), width: 0, style: BorderStyle.none),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  ),
);
