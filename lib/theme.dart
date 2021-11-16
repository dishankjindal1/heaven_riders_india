import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myAppThemeLight() => ThemeData.light().copyWith(
      visualDensity: VisualDensity.compact,
      textTheme: TextTheme(
        headline1:
            GoogleFonts.roboto().copyWith(fontSize: 18, color: Colors.black87),
        headline2:
            GoogleFonts.roboto().copyWith(fontSize: 18, color: Colors.black87),
        subtitle1:
            GoogleFonts.roboto().copyWith(fontSize: 10, color: Colors.black87),
        subtitle2:
            GoogleFonts.roboto().copyWith(fontSize: 8, color: Colors.black87),
        bodyText1:
            GoogleFonts.roboto().copyWith(fontSize: 14, color: Colors.black87),
        bodyText2:
            GoogleFonts.roboto().copyWith(fontSize: 11, color: Colors.black87),
        caption:
            GoogleFonts.roboto().copyWith(fontSize: 9, color: Colors.black87),
        button: GoogleFonts.roboto()
            .copyWith(fontSize: 16, letterSpacing: 0.5, color: Colors.black87),
        overline:
            GoogleFonts.roboto().copyWith(fontSize: 10, color: Colors.black87),
      ),
    );

ThemeData myAppThemeDark() => ThemeData.dark().copyWith(
      textTheme: TextTheme(
        headline1: GoogleFonts.roboto().copyWith(
            fontSize: 18, letterSpacing: 0.5, overflow: TextOverflow.fade),
        headline2: GoogleFonts.roboto().copyWith(
            fontSize: 17, letterSpacing: 0.5, overflow: TextOverflow.fade),
        headline3: GoogleFonts.roboto().copyWith(
            fontSize: 16, letterSpacing: 0.5, overflow: TextOverflow.fade),
        subtitle1: GoogleFonts.roboto().copyWith(fontSize: 10),
        subtitle2: GoogleFonts.roboto().copyWith(fontSize: 8),
        bodyText1: GoogleFonts.roboto().copyWith(
            fontSize: 12, letterSpacing: 0.5, overflow: TextOverflow.fade),
        bodyText2: GoogleFonts.roboto().copyWith(
            fontSize: 11, letterSpacing: 0.5, overflow: TextOverflow.fade),
        caption: GoogleFonts.roboto().copyWith(fontSize: 9),
        button: GoogleFonts.roboto().copyWith(
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 2,
        ),
        overline: GoogleFonts.roboto().copyWith(fontSize: 10),
      ),
    );
