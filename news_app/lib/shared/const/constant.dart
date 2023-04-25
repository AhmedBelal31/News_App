import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      bodyText2: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 20.0,
    ));

ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    bodyText2: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  primarySwatch: Colors.deepOrange,
  primaryColor: Colors.deepOrange,
  appBarTheme: AppBarTheme(
      backgroundColor: HexColor('333739'),
      titleTextStyle: const TextStyle(color: Colors.white),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light)),
  scaffoldBackgroundColor: HexColor('333739'),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('333739'),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.deepOrange),
  //colorScheme: ColorScheme.dark()
);
