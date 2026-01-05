import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/intro/components/side_menu_button.dart';
import 'package:flutter_portfolio/view/main/components/connect_button.dart';
import '../../../res/constants.dart';
import 'navigation_button_list.dart';
import 'language_switch.dart';
import 'day_night_switch.dart';
class TopNavigationBar extends StatelessWidget {
  final VoidCallback? openDrawer;
  const TopNavigationBar({super.key, this.openDrawer});
  @override
  Widget build(BuildContext context) {
    final bool isSmall = Responsive.isLargeMobile(context);
    final bool isTablet = Responsive.isTablet(context) && !isSmall;
    if (isSmall) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            MenuButton(),
            SizedBox(width: defaultPadding),
            ConnectButton(),
            SizedBox(width: defaultPadding / 2),
            DayNightSwitch(),
            SizedBox(width: defaultPadding / 2),
            LanguageSwitch(),
          ],
        ),
      );
    } else if (isTablet) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: MenuButton(onTap: openDrawer ?? () => Scaffold.of(context).openDrawer(),),
            ),
            const SizedBox(width: defaultPadding),
            NavigationButtonList(openDrawer: openDrawer),
            const SizedBox(width: defaultPadding),
            const ConnectButton(),
            const SizedBox(width: defaultPadding / 2),
            const DayNightSwitch(),
            const SizedBox(width: defaultPadding / 2),
            const LanguageSwitch(),
          ],
        ),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: MenuButton(onTap: openDrawer ?? () => Scaffold.of(context).openDrawer(),),
          ),
          const Spacer(flex: 2,),
          NavigationButtonList(openDrawer: openDrawer),
          const Spacer(flex: 2,),
          const ConnectButton(),
          const DayNightSwitch(),
          const LanguageSwitch(),
          const Spacer(),
        ],
      );
    }
  }
}
