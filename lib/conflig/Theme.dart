// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:social_media/conflig/color.dart';

var lightTheme = ThemeData();
var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: dBackgroundColor,
    filled: true,
  ),
  colorScheme: ColorScheme.dark(
    primary: dPrimaryColor,
    onPrimary: const Color.fromARGB(255, 248, 248, 248),
    // ignore: deprecated_member_use
    background: dBackgroundColor,
    // ignore: deprecated_member_use
    onBackground: const Color.fromARGB(255, 227, 230, 243),
    primaryContainer: dContainerColor,
    onPrimaryContainer: donContainerColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      color: dPrimaryColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontSize: 30,
      color: dOnBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      color: dPrimaryColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: dOnBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 15,
      color: const Color.fromARGB(255, 254, 237, 237),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: dOnBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: donContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: donContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
    ),
  ),
);
