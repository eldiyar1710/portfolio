import 'package:flutter/material.dart';
import '../view model/day_night_controller.dart';

class AppTheme {
  static ThemeData build(DayNightMode mode, ThemeData base) {
    final isDay = mode == DayNightMode.day;
    final bg = isDay ? const Color(0xFF0A1A3A) : const Color(0xFF000515);
    final onSurface = isDay ? const Color(0xFFFAFAFA) : Colors.white;
    final body = isDay ? const Color(0xFFDFDFE2) : const Color(0xFF8B8B8D);
    final scheme = ColorScheme.fromSeed(
      seedColor: isDay ? const Color(0xFF1976D2) : const Color(0xFF0D47A1),
      brightness: Brightness.dark,
      surface: isDay ? const Color(0xFF0E244A) : const Color(0xFF0A1329),
      onSurface: onSurface,
    );
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: bg,
      textTheme: base.textTheme
          .apply(bodyColor: onSurface, displayColor: onSurface)
          .copyWith(
            bodyLarge: TextStyle(color: body),
            bodyMedium: TextStyle(color: body),
          ),
    );
  }
}
