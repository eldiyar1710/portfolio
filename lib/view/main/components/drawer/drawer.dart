import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/main/components/drawer/contact_icons.dart';
import 'package:flutter_portfolio/view/main/components/drawer/personal_info.dart';
import '../../../../res/constants.dart';
import 'knowledges.dart';
import 'about.dart';
import 'my_skill.dart';
import 'experience.dart';
import 'package:flutter_portfolio/view/common/glass_container.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const About(),
            Padding(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: GlassContainer(
                borderRadius: 24,
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PersonalInfo(),
                    Experience(),
                    MySKills(),
                    Knowledges(),
                    Divider(),
                    SizedBox(height: defaultPadding),
                    ContactIcon(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

