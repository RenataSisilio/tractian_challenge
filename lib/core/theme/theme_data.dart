import 'package:flutter/material.dart';

abstract interface class TractianTheme {
  static final _colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF17192D),
    surface: const Color(0xFFFFFFFF),
    onSurface: const Color(0xFF17192D),
    onSurfaceVariant: const Color(0xFF77818C),
    primary: const Color(0xFF17192D),
    surfaceContainer: const Color(0xFF2188FF),
    onPrimary: const Color(0xFFFFFFFF),
    outline: const Color(0xFF8E98A3),
    outlineVariant: const Color(0xFFEAEFF3),
  );

  static final _appBarTheme = AppBarTheme(
    backgroundColor: _colorScheme.primary,
    foregroundColor: _colorScheme.onPrimary,
    centerTitle: true,
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    border: const OutlineInputBorder(borderSide: BorderSide.none),
    filled: true,
    fillColor: _colorScheme.outlineVariant,
    prefixIconColor: _colorScheme.outline,
    contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
    hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );

  static final themeData = ThemeData(
    colorScheme: _colorScheme,
    appBarTheme: _appBarTheme,
    inputDecorationTheme: _inputDecorationTheme,
    chipTheme: ChipThemeData(
      surfaceTintColor: _colorScheme.surface,
      color: WidgetStateProperty.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? _colorScheme.surfaceContainer
              : Colors.transparent),
    ),
    useMaterial3: true,
  );
}
