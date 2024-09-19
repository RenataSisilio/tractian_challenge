import 'package:flutter/material.dart';

abstract interface class TractianTheme {
  static final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF17192D),
    surface: const Color(0xFFFFFFFF),
    primary: const Color(0xFF17192D),
    surfaceContainer: const Color(0xFF2188FF),
    onPrimary: const Color(0xFFFFFFFF),
  );

  static final themeData = ThemeData(
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      centerTitle: true,
    ),
    useMaterial3: true,
  );
}
