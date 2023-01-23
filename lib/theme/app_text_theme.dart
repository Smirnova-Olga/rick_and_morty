import 'package:flutter/material.dart';
import 'package:rick_and_morty/gen/fonts.gen.dart';

abstract class AppTextTheme {
  static const body1 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.5,
  );
  static const body2 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.25,
  );
  static const subtitle1 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.15,
  );
}
