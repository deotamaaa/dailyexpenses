import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      textTheme: GoogleFonts.interTextTheme(),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: const Color(0xffFF6600),
            secondary: const Color(0xffFF6600),
          ),
    );
  }
}
