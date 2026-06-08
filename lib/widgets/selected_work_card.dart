import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../models/selected_work.dart';
import '../utils/link_launcher.dart';

class SelectedWorkCard extends StatelessWidget {
  final SelectedWork work;

  const SelectedWorkCard({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      width: isMobile ? double.infinity : 860,
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
        const Text(
          'MY ROLE',
          style: TextStyle(
            color: AppTheme.primary,
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          work.role,
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 15,
            height: 1.55,
            fontWeight: FontWeight.w700,
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
        const SizedBox(height: 24),
        _WorkCta(work: work),
      ],
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
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppTheme.border),
          gradient: hasImage
              ? null
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primary.withValues(alpha: 0.20),
                    AppTheme.surface,
                    AppTheme.background,
                  ],
                ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Stack(
            children: [
              if (hasImage)
                Positioned.fill(
                  child: Image.asset(
                    work.imagePath!,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                )
              else
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

              // dark overlay so text stays readable
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: hasImage ? 0.18 : 0),
                        Colors.black.withValues(alpha: hasImage ? 0.55 : 0),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 22,
                left: 22,
                right: 22,
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

              Positioned(
                left: 22,
                right: 22,
                bottom: 22,
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
        icon: Icon(
          hasUrl ? Icons.open_in_new : Icons.article_outlined,
          size: 16,
        ),
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
