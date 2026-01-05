import 'package:flutter/material.dart';
import '../../../view model/day_night_controller.dart';

class DayNightSwitch extends StatelessWidget {
  const DayNightSwitch({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DayNightMode>(
      valueListenable: DayNightController.mode,
      builder: (context, mode, _) {
        IconData icon;
        switch (mode) {
          case DayNightMode.auto:
            icon = Icons.brightness_auto;
            break;
          case DayNightMode.day:
            icon = Icons.wb_sunny;
            break;
          case DayNightMode.night:
            icon = Icons.nights_stay;
            break;
        }
        return IconButton(
          onPressed: DayNightController.toggle,
          icon: Icon(icon, color: Colors.white),
          tooltip: 'Day/Night/Auto',
        );
      },
    );
  }
}

