import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'animated_texts_componenets.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';
class IntroBody extends StatelessWidget {
  const IntroBody({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final double contentWidth = Responsive.isDesktop(context)
        ? size.width * 0.5
        : size.width * 0.9;
    final bool isNarrow = size.width < 480;
    final double topGap1 = isNarrow ? size.height * 0.03 : size.height * 0.06;
    final double topGap2 = isNarrow ? size.height * 0.06 : size.height * 0.10;
    final double pandaW = math.min(math.max(size.width * 0.6, 140), 220);
    final double pandaH = math.min(math.max(size.height * 0.35, 160), 260);
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: contentWidth),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!Responsive.isDesktop(context))
                SizedBox(height: topGap1),
              if (!Responsive.isDesktop(context))
                Center(
                  child: AnimatedImageContainer(
                    width: pandaW,
                    height: pandaH,
                  ),
                ),
              if (!Responsive.isDesktop(context))
                SizedBox(height: topGap2),
              const Responsive(
                  desktop: MyPortfolioText(start: 40, end: 50),
                  largeMobile: MyPortfolioText(start: 40, end: 35),
                  mobile: MyPortfolioText(start: 35, end: 30),
                  tablet: MyPortfolioText(start: 50, end: 40)),
              if (kIsWeb && Responsive.isLargeMobile(context))
                Container(
                  height: defaultPadding,
                  color: Colors.transparent,
                ),
              const CombineSubtitleText(),
              const SizedBox(height: defaultPadding / 2),
              const Responsive(
                desktop: AnimatedDescriptionText(start: 14, end: 15),
                largeMobile: AnimatedDescriptionText(start: 14, end: 12),
                mobile: AnimatedDescriptionText(start: 14, end: 12),
                tablet: AnimatedDescriptionText(start: 17, end: 14),
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              const DownloadButton(),
            ],
          ),
        ))),
        if (Responsive.isDesktop(context)) ...[
          const Spacer(),
          const AnimatedImageContainer(),
          const Spacer(),
        ]
      ],
    );
  }
}
