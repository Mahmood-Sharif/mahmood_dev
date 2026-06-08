import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../models/selected_work.dart';
import '../utils/link_launcher.dart';

class SelectedWorkCard extends StatelessWidget {
  final SelectedWork work;

  const SelectedWorkCard({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 820;

    return Container(
      width: isMobile ? double.infinity : 960,
      padding: EdgeInsets.all(isMobile ? 18 : 26),
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.24),
            blurRadius: 34,
            offset: const Offset(0, 22),
          ),
        ],
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _WorkVisual(work: work),
                const SizedBox(height: 22),
                _WorkInfo(work: work),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 5, child: _WorkInfo(work: work)),
                const SizedBox(width: 24),
                Expanded(flex: 5, child: _WorkVisual(work: work)),
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
    final isMobile = MediaQuery.sizeOf(context).width < 820;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProjectNumber(number: work.number),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        work.category,
                        style: const TextStyle(
                          color: AppTheme.primary,
                          fontSize: 13,
                          height: 1.35,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        work.title,
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: isMobile ? 34 : 44,
                          height: 1.02,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
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
            _ImpactBlock(text: work.outcome),
            const SizedBox(height: 18),
            _RoleBlock(text: work.role),
            const SizedBox(height: 22),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: work.tools
                  .map((tool) => _ToolPill(tool: tool))
                  .toList(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: _WorkCta(work: work),
        ),
      ],
    );
  }
}

class _ProjectNumber extends StatelessWidget {
  final String number;

  const _ProjectNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: AppTheme.accent.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.44)),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            color: AppTheme.accent,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _ImpactBlock extends StatelessWidget {
  final String text;

  const _ImpactBlock({required this.text});

  @override
  Widget build(BuildContext context) {
    return _ProofBlock(
      icon: Icons.trending_up,
      label: 'Impact',
      text: text,
      color: AppTheme.success,
    );
  }
}

class _RoleBlock extends StatelessWidget {
  final String text;

  const _RoleBlock({required this.text});

  @override
  Widget build(BuildContext context) {
    return _ProofBlock(
      icon: Icons.person_pin_circle_outlined,
      label: 'My role',
      text: text,
      color: AppTheme.primary,
    );
  }
}

class _ProofBlock extends StatelessWidget {
  final IconData icon;
  final String label;
  final String text;
  final Color color;

  const _ProofBlock({
    required this.icon,
    required this.label,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.58),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 19),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                    height: 1.45,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolPill extends StatelessWidget {
  final String tool;

  const _ToolPill({required this.tool});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.border),
      ),
      child: Text(
        tool,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _WorkVisual extends StatelessWidget {
  final SelectedWork work;

  const _WorkVisual({required this.work});

  @override
  Widget build(BuildContext context) {
    final hasImage = work.imagePath != null;

    return AspectRatio(
      aspectRatio: 1.08,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          border: Border.all(color: AppTheme.border),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          child: Stack(
            children: [
              Positioned.fill(
                child: hasImage
                    ? Image.asset(
                        work.imagePath!,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      )
                    : Icon(
                        _iconForWork(work.title),
                        color: AppTheme.primary,
                        size: 54,
                      ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.04),
                        Colors.black.withValues(alpha: 0.66),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: _VisualLabel(text: work.visualLabel),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        work.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 28,
                          height: 1.05,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppTheme.textPrimary,
                        borderRadius: BorderRadius.circular(
                          AppTheme.cardRadius,
                        ),
                      ),
                      child: Icon(
                        _iconForWork(work.title),
                        color: AppTheme.background,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

class _VisualLabel extends StatelessWidget {
  final String text;

  const _VisualLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.background.withValues(alpha: 0.74),
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 11,
            height: 1.2,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _WorkCta extends StatelessWidget {
  final SelectedWork work;

  const _WorkCta({required this.work});

  @override
  Widget build(BuildContext context) {
    final hasUrl = work.url != null;

    return MouseRegion(
      cursor: hasUrl ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: OutlinedButton.icon(
        onPressed: hasUrl ? () => launchExternalUrl(work.url!) : null,
        icon: Icon(hasUrl ? Icons.open_in_new : Icons.lock_outline, size: 16),
        label: Text(work.ctaLabel),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.textPrimary,
          disabledForegroundColor: AppTheme.textMuted,
          side: BorderSide(color: hasUrl ? AppTheme.primary : AppTheme.border),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
