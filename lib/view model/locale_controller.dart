import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController {
  static final ValueNotifier<Locale> locale = ValueNotifier(const Locale('ru'));
  static Future<void> setLocale(Locale l) async {
    locale.value = l;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', l.languageCode);
  }
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    String? saved = prefs.getString('locale');
    String code = saved ??
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    if (!['en', 'ru', 'kk'].contains(code)) {
      code = 'ru';
    }
    locale.value = Locale(code);
  }
}
