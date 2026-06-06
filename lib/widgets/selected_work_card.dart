import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../models/selected_work.dart';

class SelectedWorkCard extends StatelessWidget {
  final SelectedWork work;

  const SelectedWorkCard({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      width: isMobile ? double.infinity : 760,
      padding: EdgeInsets.all(isMobile ? 24 : 34),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(34),
        border: Border.all(color: AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.20),
            blurRadius: 30,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _WorkInfo(work: work),
                const SizedBox(height: 24),
                _WorkVisual(work: work),
              ],
            )
          : Row(
              children: [
                Expanded(flex: 5, child: _WorkInfo(work: work)),
                const SizedBox(width: 34),
                Expanded(flex: 4, child: _WorkVisual(work: work)),
              ],
            ),
    );
  }
}

class _WorkInfo extends StatelessWidget {
  final SelectedWork work;

  const _WorkInfo({required this.work});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          work.number,
          style: const TextStyle(
            color: AppTheme.primary,
            fontSize: 54,
            height: 1,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          work.title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 34,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          work.category,
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          work.description,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 17,
            height: 1.55,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          work.role,
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 15,
            height: 1.55,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: work.tools
              .map(
                (tool) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Text(
                    tool,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _WorkVisual extends StatelessWidget {
  final SelectedWork work;

  const _WorkVisual({required this.work});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppTheme.border),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.primary.withValues(alpha: 0.20),
              AppTheme.surface,
              AppTheme.background,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 24,
              left: 24,
              right: 24,
              child: Text(
                work.visualLabel,
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontSize: 13,
                  height: 1.4,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 124,
                height: 124,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primary.withValues(alpha: 0.14),
                  border: Border.all(
                    color: AppTheme.primary.withValues(alpha: 0.35),
                  ),
                ),
                child: Icon(
                  _iconForWork(work.title),
                  color: AppTheme.primary,
                  size: 54,
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: Text(
                work.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconForWork(String title) {
    switch (title) {
      case 'Jareb':
        return Icons.location_on_outlined;
      case 'Academity':
        return Icons.payments_outlined;
      default:
        return Icons.hub_outlined;
    }
  }
}
