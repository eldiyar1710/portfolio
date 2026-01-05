import 'package:flutter/material.dart';

import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import '../../common/glass_container.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}
class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _hovered = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: MouseRegion(
            onEnter: (_) => setState(() => _hovered = true),
            onExit: (_) => setState(() => _hovered = false),
            child: AnimatedScale(
              scale: _hovered ? 1.03 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                height: widget.height!,
                width: widget.width!,
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Colors.pinkAccent, Colors.blue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withValues(alpha: 0.6),
                          offset: const Offset(-2, 0),
                          blurRadius: _hovered ? 24 : 18,
                        ),
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.6),
                          offset: const Offset(2, 0),
                          blurRadius: _hovered ? 24 : 18,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: GlassContainer(
                        borderRadius: 30,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset(
                            'assets/images/44CEFC22-E0E2-4770-854F-4319DA5FEC83.PNG',
                            height: Responsive.isLargeMobile(context)
                                ? MediaQuery.sizeOf(context).width * 0.2
                                : Responsive.isTablet(context)
                                    ? MediaQuery.sizeOf(context).width * 0.14
                                    : 200,
                            width: Responsive.isLargeMobile(context)
                                ? MediaQuery.sizeOf(context).width * 0.2
                                : Responsive.isTablet(context)
                                    ? MediaQuery.sizeOf(context).width * 0.14
                                    : 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
