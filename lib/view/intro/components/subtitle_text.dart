import 'package:flutter/material.dart';

class AnimatedSubtitleText extends StatelessWidget {
  final double start;
  final double end;
  final String text;
  final bool gradient;
  const AnimatedSubtitleText(
      {super.key, required this.start, required this.end, required this.text, this.gradient=false,});
  @override
  Widget build(BuildContext context) {
    double _targetForWidth(double w) {
      final double minW = 360;
      final double maxW = 1920;
      final double t = ((w - minW) / (maxW - minW)).clamp(0.0, 1.0);
      return 20 + t * (44 - 20);
    }
    final double endDynamic = _targetForWidth(MediaQuery.sizeOf(context).width);
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: endDynamic),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          text,
          softWrap: true,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              shadows: gradient? [
                const Shadow(color: Colors.pink,offset: Offset(0, 2),blurRadius: 10),
                const Shadow(color: Colors.pink,offset: Offset(0, -2),blurRadius: 10),
              ] :[] ,
              height: 1.05,
              fontSize: value),
        );
      },
    );
  }
}
