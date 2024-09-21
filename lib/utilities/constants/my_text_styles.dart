import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsTextStyles {
  static TextStyle get _baseTextStyle =>
      GoogleFonts.roboto().copyWith(height: 1.5);

  static TextStyle get primaryText300 =>
      _baseTextStyle.copyWith(fontWeight: FontWeight.w300);

  static TextStyle get primaryText400 =>
      _baseTextStyle.copyWith(fontWeight: FontWeight.w400);

  static TextStyle get primaryText500 =>
      _baseTextStyle.copyWith(fontWeight: FontWeight.w500);

  static TextStyle get primaryText600 =>
      _baseTextStyle.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get primaryText700 =>
      _baseTextStyle.copyWith(fontWeight: FontWeight.w700);

  static TextStyle get primaryText800 =>
      _baseTextStyle.copyWith(fontWeight: FontWeight.w800);

  static TextStyle get primaryText900 =>
      _baseTextStyle.copyWith(fontWeight: FontWeight.w900);
}
