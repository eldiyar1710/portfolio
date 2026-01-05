import 'package:flutter/material.dart';
import '../../../view model/locale_controller.dart';
import '../../../res/constants.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});
  @override
  Widget build(BuildContext context) {
    final current = Localizations.localeOf(context).languageCode;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding/2),
      child: Row(
        children: [
          _LangBtn(code: 'ru', current: current, label: 'RU'),
          const SizedBox(width: 8),
          _LangBtn(code: 'en', current: current, label: 'EN'),
          const SizedBox(width: 8),
          _LangBtn(code: 'kk', current: current, label: 'KZ'),
        ],
      ),
    );
  }
}

class _LangBtn extends StatelessWidget {
  final String code;
  final String current;
  final String label;
  const _LangBtn({required this.code, required this.current, required this.label});
  @override
  Widget build(BuildContext context) {
    final selected = current == code;
    return TextButton(
      onPressed: () { LocaleController.setLocale(Locale(code)); },
      child: Text(label, style: TextStyle(color: selected ? Colors.amber : Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.bold)),
    );
  }
}
