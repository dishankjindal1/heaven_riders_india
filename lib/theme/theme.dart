import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myAppTheme() => ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF021323), // Black - 1 // final
        primaryVariant: const Color(0xFF609AFD), // Blue - 1 // final
        onPrimary: const Color(0xFFEFEFEF), // White - 1 // final
        secondary: const Color(0xFFEFEFEF), // White - 1 // final
        secondaryVariant: const Color(0xFF021323), // Black - 1 // final
        onSecondary: const Color(0xFFF18228), // Orange - 1 // final
        // background: const Color(0xFF021323), // Black - 1
        // onBackground: const Color(0xFFEFEFEF), // White - 1
        // surface: const Color(0xFF021323), // Black - 1
        // onSurface: const Color(0xFFEFEFEF), // White - 1
        // error: const Color(0xFF021323), // Black - 1
        // onError: const Color(0xFFEFEFEF), // White - 1
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.roboto().copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        headline2: GoogleFonts.roboto().copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        headline3: GoogleFonts.roboto().copyWith(
          // Used in Card Title
          color: const Color(0xFF021323), // Black - 1
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        headline4: GoogleFonts.roboto().copyWith(
          // Used in Card Title
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        subtitle1: GoogleFonts.roboto().copyWith(
          fontSize: 14,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        subtitle2: GoogleFonts.roboto().copyWith(
          fontSize: 24,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        bodyText1: GoogleFonts.roboto().copyWith(
          fontSize: 12,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        bodyText2: GoogleFonts.roboto().copyWith(
          // color: const Color(0xFF6A777A), // Grey - 1
          fontSize: 11,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        caption: GoogleFonts.roboto().copyWith(
          fontSize: 9,
        ),
        button: GoogleFonts.roboto().copyWith(
          fontSize: 20,
          // color: const Color(0xFFEFEFEF), // White - 1
          letterSpacing: 2,
        ),
        overline: GoogleFonts.roboto().copyWith(
          overflow: TextOverflow.fade,
          // color: const Color(0xFFB3B2B8), // Grey - 2
          fontSize: 10,
        ),
      ),
      primaryTextTheme: TextTheme(
        // Sliver Title
        headline1: GoogleFonts.oswald().copyWith(
          debugLabel: 'appBar_sliver_title',
          color: const Color(0xFFEFEFEF), // White - 1
          fontWeight: FontWeight.bold,
          fontSize: 45,
          letterSpacing: 1,
        ),
        //Sliver Sub Title
        headline2: GoogleFonts.oswald().copyWith(
          debugLabel: 'appBar_sliver_title',
          color: const Color(0xFF6A777A), // Grey - 1
          fontSize: 30,
          letterSpacing: 1,
        ),
        bodyText1: GoogleFonts.roboto().copyWith(
          // AppBar search text
          fontSize: 16,
          letterSpacing: 0.5,
          overflow: TextOverflow.fade,
        ),
        button: GoogleFonts.roboto().copyWith(
          fontSize: 20,
          letterSpacing: 2,
        ),
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
          color: const Color(0xFFEFEFEF), // White - 1
        ),
        unselectedLabelStyle: const TextStyle().copyWith(
          fontSize: 0,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        // iconColor: const Color(0xFFF18228), // Orange - 1
        border: InputBorder.none,
        hintStyle: GoogleFonts.roboto().copyWith(
          overflow: TextOverflow.ellipsis,
          // color: const Color(0xFFB3B2B8), // Grey - 2
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        helperStyle: GoogleFonts.roboto().copyWith(
          overflow: TextOverflow.ellipsis,
          // color: const Color(0xFFB3B2B8), // Grey - 2
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
        errorStyle: GoogleFonts.roboto().copyWith(
          overflow: TextOverflow.ellipsis,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: const ButtonStyle().copyWith(
      //     backgroundColor: MaterialStateProperty.all(
      //       const Color(0xFFF18228),
      //     ),
      //     overlayColor: MaterialStateProperty.all(
      //       const Color(0x55FFFFFF),
      //     ),
      //   ),
      // ),
    );

BoxDecoration myAppBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(0),
    );
