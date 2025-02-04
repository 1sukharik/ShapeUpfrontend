import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';

ThemeData basicTheme() => ThemeData(
      textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: fontNameDefault,
            fontSize: largeTextSize,
            color: kPrimaryTextColor,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: TextStyle(
            fontFamily: fontNameDefault,
            fontSize: mediumTextSize,
            color: kPrimaryTextColor,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            fontFamily: fontNameDefault,
            fontSize: bodyTextSize,
            color: kPrimaryTextColor,
            fontWeight: FontWeight.w500,
          )),
    );
