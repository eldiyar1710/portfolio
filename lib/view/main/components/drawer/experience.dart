import 'package:flutter/material.dart';

import '../../../../res/constants.dart';
import '../../../../l10n/app_localizations.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.company, required this.role, required this.period, required this.points});
  final String company;
  final String role;
  final String period;
  final List<String> points;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(company, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text('$role · $period', style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          ...points.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(color: Colors.white)),
                    Expanded(child: Text(p, style: const TextStyle(color: Colors.white))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class Experience extends StatelessWidget {
  const Experience({super.key});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(l.t('experience_title'), style: const TextStyle(color: Colors.white)),
        ),
        ExperienceItem(
          company: 'AMANBAY TECH',
          role: l.t('experience_role'),
          period: '2023–2024',
          points: [
            l.t('exp_p1'),
            l.t('exp_p2'),
            l.t('exp_p3'),
            l.t('exp_p4'),
            l.t('exp_p5'),
          ],
        ),
      ],
    );
  }
}
