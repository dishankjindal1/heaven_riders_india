import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myAppTheme() => ThemeData(
      textTheme: TextTheme(
        headline1: GoogleFonts.roboto().copyWith(
          fontSize: 18,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        headline2: GoogleFonts.roboto().copyWith(
          fontSize: 17,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        headline3: GoogleFonts.roboto().copyWith(
          fontSize: 16,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        subtitle1: GoogleFonts.roboto().copyWith(fontSize: 10),
        subtitle2: GoogleFonts.roboto().copyWith(fontSize: 8),
        bodyText1: GoogleFonts.roboto().copyWith(
          fontSize: 12,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        bodyText2: GoogleFonts.roboto().copyWith(
          fontSize: 11,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        caption: GoogleFonts.roboto().copyWith(fontSize: 9),
        button: GoogleFonts.roboto().copyWith(
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 2,
        ),
        overline: GoogleFonts.roboto().copyWith(fontSize: 10),
      ),
      cardTheme: const CardTheme().copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      appBarTheme: const AppBarTheme().copyWith(
        centerTitle: true,
        backgroundColor: const Color(0xFF021323), // Black - 1
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        backgroundColor: const Color(0xFF021323),
        selectedIconTheme: const IconThemeData().copyWith(
          color: const Color(0xFFF18228), // Orange 1
          size: 24,
        ),
        selectedLabelStyle: const TextStyle().copyWith(
          fontSize: 0,
        ),
        unselectedIconTheme: const IconThemeData().copyWith(
          color: const Color(0xFFEFEFEF), // White 1
        ),
        unselectedLabelStyle: const TextStyle().copyWith(
          fontSize: 0,
        ),
      ),
    );
