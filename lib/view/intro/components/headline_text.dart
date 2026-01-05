import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';

class MyPortfolioText extends StatelessWidget {
  const MyPortfolioText({super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    double _targetForWidth(double w) {
      final double minW = 360;
      final double maxW = 1920;
      final double t = ((w - minW) / (maxW - minW)).clamp(0.0, 1.0);
      return 24 + t * (48 - 24);
    }
    final double endDynamic = _targetForWidth(MediaQuery.sizeOf(context).width);
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: endDynamic),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(AppLocalizations.of(context).t('headline_title'),
            softWrap: true,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 1.0,
                fontSize: value));
      },
    );
  }
}
