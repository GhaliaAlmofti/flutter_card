import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ------------------- API CONSTS -------------------
String baseUrl = "https://demo.vueltd.co.uk/api/v1";

// ------------------- COLORS CONSTS -------------------

const Color primaryColor = Color(0xff1F4ED9);

const Color whiteColor = Color(0xffEAF1FF);
const Color blackColor = Color(0xff000C23);

const Color redColor = Color(0xffC63E3E);
const Color greenColor = Color(0xff029802);

// ------------------- TEXT CONSTS -------------------

Duration animationDuration = Duration(milliseconds: 300);

TextStyle displaySmall = GoogleFonts.cairo(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
TextStyle displayMedium = GoogleFonts.cairo(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
TextStyle displayLarge = GoogleFonts.cairo(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);

TextStyle labelSmall = GoogleFonts.cairo(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
TextStyle labelMedium = GoogleFonts.cairo(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
TextStyle labelLarge = GoogleFonts.cairo(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

TextStyle bodySmall = GoogleFonts.cairo(
  fontSize: 12,
  fontWeight: FontWeight.normal,
);
TextStyle bodyMedium = GoogleFonts.cairo(
  fontSize: 14,
  fontWeight: FontWeight.normal,
);
TextStyle bodyLarge = GoogleFonts.cairo(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);
