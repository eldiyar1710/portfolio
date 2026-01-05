import 'package:flutter/material.dart';

import '../../../../res/constants.dart';
import '../../../../l10n/app_localizations.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding/2,),
        AreaInfoText(title: l.t('contact'), text: contactPhoneDisplay),
        AreaInfoText(title: l.t('email'), text: 'eldiyar1710@gmail.com'),
        AreaInfoText(title: l.t('github'), text: '@eldiyar1710'),
        const SizedBox(
          height: defaultPadding,
        ),
        Text(l.t('skills'),style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
