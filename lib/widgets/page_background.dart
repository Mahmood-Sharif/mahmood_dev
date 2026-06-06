import 'package:flutter/material.dart';

import '../app/app_theme.dart';

class PageBackground extends StatelessWidget {
  final Widget child;

  const PageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ColoredBox(color: AppTheme.background, child: SizedBox.expand()),
        Positioned(
          top: -120,
          right: -120,
          child: _GlowOrb(size: 360, color: AppTheme.primary, opacity: 0.14),
        ),
        Positioned(
          top: 520,
          left: -180,
          child: _GlowOrb(size: 420, color: Color(0xFF6366F1), opacity: 0.10),
        ),
        Positioned(
          bottom: -160,
          right: -160,
          child: _GlowOrb(size: 420, color: Color(0xFF14B8A6), opacity: 0.08),
        ),
        child,
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const _GlowOrb({
    required this.size,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: opacity),
              blurRadius: size / 2,
              spreadRadius: size / 8,
            ),
          ],
        ),
      ),
    );
  }
}
