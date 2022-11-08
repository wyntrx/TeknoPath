import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        color: Colors.black87, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.montserrat(color: Colors.black87),
    subtitle1: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 24,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        color: Colors.white, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.montserrat(color: Colors.white),
    subtitle1: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 24,
    ),
  );
}
