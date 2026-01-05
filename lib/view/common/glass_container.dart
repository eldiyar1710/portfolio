import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Color? tint;
  final double blur;
  final double borderOpacity;
  final double shadowOpacity;
  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius = 24,
    this.tint,
    this.blur = 20,
    this.borderOpacity = 0.16,
    this.shadowOpacity = 0.10,
  });
  @override
  Widget build(BuildContext context) {
    final base = tint ?? Theme.of(context).colorScheme.surface.withValues(alpha: 0.18);
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: base,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: borderOpacity)),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: shadowOpacity), blurRadius: 16, offset: const Offset(0, 6)),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

