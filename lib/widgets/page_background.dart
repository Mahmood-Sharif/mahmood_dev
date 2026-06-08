import 'package:flutter/material.dart';

import '../app/app_theme.dart';

class PageBackground extends StatelessWidget {
  final Widget child;

  const PageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            color: AppTheme.background,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF12100F),
                AppTheme.background,
                Color(0xFF11151A),
              ],
            ),
          ),
          child: SizedBox.expand(),
        ),
        Positioned.fill(child: CustomPaint(painter: _EditorialGridPainter())),
        child,
      ],
    );
  }
}

class _EditorialGridPainter extends CustomPainter {
  const _EditorialGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.035)
      ..strokeWidth = 1;
    const spacing = 56.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final accentPaint = Paint()
      ..color = AppTheme.accent.withValues(alpha: 0.16)
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(size.width * 0.08, 0),
      Offset(size.width * 0.48, size.height),
      accentPaint,
    );

    final primaryPaint = Paint()
      ..color = AppTheme.primary.withValues(alpha: 0.10)
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(size.width * 0.98, 0),
      Offset(size.width * 0.62, size.height),
      primaryPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
