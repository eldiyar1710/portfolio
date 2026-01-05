import 'dart:math';
import 'package:flutter/material.dart';

import '../../view model/day_night_controller.dart';
import 'package:flutter/scheduler.dart';

class StarfieldBackground extends StatefulWidget {
  const StarfieldBackground({super.key});
  @override
  State<StarfieldBackground> createState() => _StarfieldBackgroundState();
}

class _StarfieldBackgroundState extends State<StarfieldBackground> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Star> _nearStars = [];
  final List<_Star> _farStars = [];
  final List<_Comet> _comets = [];
  Size _size = Size.zero;
  final _rnd = Random(42);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 16000))..repeat();
  }

  void _initScene(Size size) {
    if (_size == size && _nearStars.isNotEmpty && _farStars.isNotEmpty) return;
    _size = size;
    _nearStars.clear();
    _farStars.clear();
    _comets.clear();

    final baseCount = size.width > 1200 ? 160 : size.width > 800 ? 110 : 70;
    final nearCount = (baseCount * 0.4).round();
    final farCount = (baseCount * 0.6).round();

    Color _colorAtX(double x) {
      final t = (x / max(1, size.width)).clamp(0.0, 1.0);
      final c1 = const Color(0xFFFF4081);
      final c2 = const Color(0xFF0D47A1);
      return Color.lerp(c1, c2, t)!;
    }

    for (int i = 0; i < nearCount; i++) {
      final x = _rnd.nextDouble() * size.width;
      _nearStars.add(_Star(
        x: x,
        y: _rnd.nextDouble() * size.height,
        speed: 30 + _rnd.nextDouble() * 60,   // медленные
        size: 1.2 + _rnd.nextDouble() * 2.0,  // крупнее
        opacity: 0.35 + _rnd.nextDouble() * 0.45,
        twinkle: _rnd.nextDouble() * 0.015,
        drift: (_rnd.nextDouble() - 0.5) * 0.25,
        color: _colorAtX(x),
      ));
    }
    for (int i = 0; i < farCount; i++) {
      final x = _rnd.nextDouble() * size.width;
      _farStars.add(_Star(
        x: x,
        y: _rnd.nextDouble() * size.height,
        speed: 80 + _rnd.nextDouble() * 140,  // быстрее
        size: 0.6 + _rnd.nextDouble() * 1.4,  // мельче
        opacity: 0.30 + _rnd.nextDouble() * 0.40,
        twinkle: _rnd.nextDouble() * 0.02,
        drift: (_rnd.nextDouble() - 0.5) * 0.35,
        color: _colorAtX(x),
      ));
    }

    _controller.addListener(_tick);
  }

  void _tick() {
    void updateStar(_Star s) {
      s.y += s.speed / 60.0;
      s.x += s.drift;
      s.opacity += s.twinkle * (_rnd.nextBool() ? 1 : -1);
      if (s.opacity < 0.22) s.opacity = 0.22;
      if (s.opacity > 0.85) s.opacity = 0.85;
      if (s.y > _size.height + 6) {
        s.y = -6;
        s.x = _rnd.nextDouble() * _size.width;
      }
      if (s.x < -6) s.x = _size.width + 6;
      if (s.x > _size.width + 6) s.x = -6;
    }
    for (final s in _nearStars) { updateStar(s); }
    for (final s in _farStars) { updateStar(s); }

    if (_rnd.nextDouble() < 0.005 && _comets.length < 2) {
      _spawnComet();
    }
    for (final c in _comets) {
      c.update();
    }
    _comets.removeWhere((c) => c.life <= 0);

    setState(() {});
  }

  void _spawnComet() {
    final startY = _rnd.nextDouble() * _size.height * 0.6;
    final leftToRight = _rnd.nextBool();
    final startX = leftToRight ? -20.0 : _size.width + 20.0;
    final vx = leftToRight ? (120 + _rnd.nextDouble() * 180) : -(120 + _rnd.nextDouble() * 180);
    final vy = 20 + _rnd.nextDouble() * 60;
    _comets.add(_Comet(
      pos: Offset(startX, startY),
      vel: Offset(vx / 60.0, vy / 60.0),
      color: const Color(0xFFE1F5FE), // светлый голубой
      trailMax: 40,
    ));
  }

  @override
  void dispose() {
    _controller.removeListener(_tick);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Size(constraints.maxWidth, constraints.maxHeight);
          _initScene(size);
          final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
          final mode = DayNightController.effectiveMode(brightness);
          return CustomPaint(
            painter: _StarPainter(_nearStars, _farStars, _comets, mode),
            size: size,
          );
        },
      ),
    );
  }
}

class _Star {
  double x;
  double y;
  double speed;
  double size;
  double opacity;
  double twinkle;
  double drift;
  final Color color;
  _Star({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
    required this.opacity,
    required this.twinkle,
    required this.drift,
    required this.color,
  });
}

class _Comet {
  Offset pos;
  Offset vel;
  final Color color;
  final int trailMax;
  int life = 600;
  final List<Offset> trail = [];
  _Comet({required this.pos, required this.vel, required this.color, required this.trailMax});
  void update() {
    pos = pos + vel;
    trail.add(pos);
    if (trail.length > trailMax) trail.removeAt(0);
    life--;
  }
}

class _StarPainter extends CustomPainter {
  final List<_Star> nearStars;
  final List<_Star> farStars;
  final List<_Comet> comets;
  final DayNightMode mode;
  _StarPainter(this.nearStars, this.farStars, this.comets, this.mode);
  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint();
    if (mode == DayNightMode.day) {
      final dayGrad = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0A1A3A), Color(0xFF123B6A)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
      bgPaint.shader = dayGrad;
    } else {
      final nightGrad = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF000515), Color(0xFF0D1933)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
      bgPaint.shader = nightGrad;
    }
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    final paint = Paint();
    for (final s in farStars) {
      final alphaScale = mode == DayNightMode.day ? 0.5 : 1.0;
      paint.color = s.color.withValues(alpha: s.opacity * alphaScale);
      canvas.drawCircle(Offset(s.x, s.y), s.size, paint);
    }
    for (final s in nearStars) {
      final alphaScale = mode == DayNightMode.day ? 0.6 : 1.0;
      paint.color = s.color.withValues(alpha: s.opacity * alphaScale);
      canvas.drawCircle(Offset(s.x, s.y), s.size + 0.4, paint);
    }
    for (final c in comets) {
      final headPaint = Paint()
        ..color = c.color.withValues(alpha: mode == DayNightMode.day ? 0.6 : 0.9)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      canvas.drawCircle(c.pos, 1.8, headPaint);
      for (int i = 1; i < c.trail.length; i++) {
        final p0 = c.trail[i - 1];
        final p1 = c.trail[i];
        final t = i / c.trail.length;
        final alpha = ((mode == DayNightMode.day ? 0.35 : 0.6) * (1.0 - t)).clamp(0.0, 0.6);
        final trailPaint = Paint()
          ..strokeWidth = (3.0 * (1.0 - t)) + 0.4
          ..style = PaintingStyle.stroke
          ..color = c.color.withValues(alpha: alpha);
        canvas.drawLine(p0, p1, trailPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _StarPainter oldDelegate) => true;
}
