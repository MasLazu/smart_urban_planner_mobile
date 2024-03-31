import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './styles.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Styles.primaryColor,
          background: Styles.backgroundColor,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.plusJakartaSans(
              fontSize: 56, fontWeight: FontWeight.bold, letterSpacing: -1.5),
          displayMedium: GoogleFonts.plusJakartaSans(
              fontSize: 42, fontWeight: FontWeight.bold, letterSpacing: -0.5),
          displaySmall: GoogleFonts.plusJakartaSans(
              fontSize: 36, fontWeight: FontWeight.bold),
          headlineMedium: GoogleFonts.plusJakartaSans(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headlineSmall: GoogleFonts.plusJakartaSans(
              fontSize: 24, fontWeight: FontWeight.w400),
          titleLarge: GoogleFonts.plusJakartaSans(
              fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15),
          titleMedium: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15),
          titleSmall: GoogleFonts.plusJakartaSans(
              fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1),
          bodyLarge: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyMedium: GoogleFonts.plusJakartaSans(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          labelLarge: GoogleFonts.plusJakartaSans(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          bodySmall: GoogleFonts.plusJakartaSans(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          labelSmall: GoogleFonts.plusJakartaSans(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ).apply(
          displayColor: Styles.foregroundColor,
          bodyColor: Styles.foregroundColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Styles.primaryColor,
            foregroundColor: Styles.secondaryBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Styles.backgroundColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Styles.foregroundColor,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Styles.secondaryBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            color: Styles.mutedForegroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: TextStyle(
            color: Styles.mutedForegroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 3,
          ),
          prefixStyle: TextStyle(
            color: Styles.mutedForegroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
