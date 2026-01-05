import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/subtitle_text.dart';
import '../../../view model/responsive.dart';
import '../../../l10n/app_localizations.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: [
        Responsive(
          desktop: AnimatedSubtitleText(start: 30, end: 40, text: l.t('subtitle_flutter')),
          largeMobile: AnimatedSubtitleText(start: 30, end: 25, text: l.t('subtitle_flutter')),
          mobile: AnimatedSubtitleText(start: 25, end: 20, text: l.t('subtitle_flutter')),
          tablet: AnimatedSubtitleText(start: 40, end: 30, text: l.t('subtitle_flutter')),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [Colors.pink, Colors.blue]).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Responsive(
            desktop: AnimatedSubtitleText(start: 30, end: 40, text: l.t('subtitle_developer'), gradient: false),
            largeMobile: AnimatedSubtitleText(start: 30, end: 25, text: l.t('subtitle_developer'), gradient: false),
            mobile: AnimatedSubtitleText(start: 25, end: 20, text: l.t('subtitle_developer'), gradient: false),
            tablet: AnimatedSubtitleText(start: 40, end: 30, text: l.t('subtitle_developer'), gradient: false),
          ),
        ),
      ],
    );
  }
}
