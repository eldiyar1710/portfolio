import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/splash/splash_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'l10n/app_localizations.dart';
import 'view model/locale_controller.dart';
import 'view model/day_night_controller.dart';
import 'package:flutter/scheduler.dart';
import 'theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    LocaleController.init();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: LocaleController.locale,
      builder: (context, locale, _) {
        return ValueListenableBuilder<DayNightMode>(
          valueListenable: DayNightController.mode,
          builder: (context, mode, __) {
            final base = ThemeData(
              useMaterial3: true,
              textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
            );
            final theme = AppTheme.build(
              DayNightController.effectiveMode(SchedulerBinding.instance.platformDispatcher.platformBrightness),
              base,
            );
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: theme,
              themeAnimationDuration: const Duration(milliseconds: 400),
              themeAnimationCurve: Curves.easeInOut,
              home: SplashView(),
            );
          },
        );
      },
    );
  }
}
