import 'package:flutter/material.dart';
import '../view model/day_night_controller.dart';

class AppGradients {
  static LinearGradient primary(DayNightMode mode) {
    if (mode == DayNightMode.day) {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF29B6F6), Color(0xFF1976D2), Color(0xFFFF4081)],
      );
    } else {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF7E57C2), Color(0xFF283593), Color(0xFF0D47A1)],
      );
    }
  }
}

