import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';

import 'navigation_button.dart';
import '../../../l10n/app_localizations.dart';

class NavigationButtonList extends StatelessWidget {
  final VoidCallback? openDrawer;
  const NavigationButtonList({super.key, this.openDrawer});
  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 480;
    return TweenAnimationBuilder(tween: Tween(begin: 0.0, end: 1.0), duration: const Duration(milliseconds: 200), builder: (context, value, child) {
      final navs = [
        NavigationTextButton(onTap: () {controller.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, text: AppLocalizations.of(context).t('nav_home')),
        NavigationTextButton(onTap: () { (openDrawer ?? () => Scaffold.of(context).openDrawer())(); }, text: AppLocalizations.of(context).t('nav_about')),
        NavigationTextButton(onTap: () {controller.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, text: AppLocalizations.of(context).t('nav_projects')),
      ];
      return Transform.scale(scale: value, child: isNarrow
          ? Wrap(spacing: 8, runSpacing: 4, children: navs)
          : Row(children: navs));
    },);
  }
}
