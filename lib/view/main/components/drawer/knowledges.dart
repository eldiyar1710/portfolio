import 'package:flutter/material.dart';

import 'knowledge.dart';
import '../../../../l10n/app_localizations.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(l.t('knowledge_title'),style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
        ),
        KnowledgeText(knowledge: l.t('knowledge_1')),
        KnowledgeText(knowledge: l.t('knowledge_2')),
        KnowledgeText(knowledge: l.t('knowledge_3')),
        KnowledgeText(knowledge: l.t('knowledge_4')),
        KnowledgeText(knowledge: l.t('knowledge_5')),
        KnowledgeText(knowledge: l.t('knowledge_6')),
      ],
    );
  }

}
