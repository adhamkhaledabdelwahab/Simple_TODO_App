import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: const Color(0xFF9b87f5),
      onPrimary: Colors.white,
      secondary: const Color(0xFF7E69AB),
      onSecondary: Colors.white,
      error: const Color(0xFFE53E3E),
      onError: Colors.white,
      background: const Color(0xFFFFFFFF),
      onBackground: const Color(0xFF1A1F2C),
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF1A1F2C),
      surfaceVariant: const Color(0xFFF1F0FB),
      onSurfaceVariant: const Color(0xFF1A1F2C),
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    cardTheme: CardTheme(
      color: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFF1F0FB)),
      ),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF1F0FB),
      hintStyle: TextStyle(color: const Color(0xFF8E9196)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9b87f5),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF9b87f5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFF1F0FB),
      labelStyle: const TextStyle(color: Color(0xFF1A1F2C)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF1A1F2C),
      contentTextStyle: TextStyle(color: Colors.white),
      actionTextColor: Color(0xFF9b87f5),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xFF9b87f5),
      onPrimary: Colors.white,
      secondary: const Color(0xFF7E69AB),
      onSecondary: Colors.white,
      error: const Color(0xFFFC8181),
      onError: Colors.white,
      background: const Color(0xFF1A1F2C),
      onBackground: Colors.white,
      surface: const Color(0xFF221F26),
      onSurface: Colors.white,
      surfaceVariant: const Color(0xFF403E43),
      onSurfaceVariant: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFF1A1F2C),
    cardTheme: CardTheme(
      color: const Color(0xFF221F26),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF403E43)),
      ),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF403E43),
      hintStyle: TextStyle(color: const Color(0xFF8E9196)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9b87f5),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF9b87f5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF403E43),
      labelStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF221F26),
      contentTextStyle: TextStyle(color: Colors.white),
      actionTextColor: Color(0xFF9b87f5),
    ),
  );
}
