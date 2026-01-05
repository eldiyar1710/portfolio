import 'package:flutter/material.dart';

enum DayNightMode { auto, day, night }

class DayNightController {
  static final ValueNotifier<DayNightMode> mode = ValueNotifier(DayNightMode.auto);
  static void toggle() {
    final m = mode.value;
    switch (m) {
      case DayNightMode.auto:
        mode.value = DayNightMode.day;
        break;
      case DayNightMode.day:
        mode.value = DayNightMode.night;
        break;
      case DayNightMode.night:
        mode.value = DayNightMode.auto;
        break;
    }
  }
  static DayNightMode effectiveMode(Brightness platformBrightness) {
    if (mode.value == DayNightMode.auto) {
      final hour = DateTime.now().hour;
      final nightByTime = hour >= 19 || hour < 6;
      if (nightByTime) return DayNightMode.night;
      return platformBrightness == Brightness.dark ? DayNightMode.night : DayNightMode.day;
    }
    return mode.value;
  }
}

