import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../data/experience_data.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppTheme.mobileHorizontalPadding
            : AppTheme.desktopHorizontalPadding,
        vertical: isMobile ? 64 : 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'EXPERIENCE',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'From learning code to building products.',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: isMobile ? 36 : 56,
                  height: 1.05,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'A timeline of the projects and decisions that shaped how I build.',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 18,
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: isMobile ? 42 : 64),
              isMobile
                  ? const _MobileExperienceTimeline()
                  : const _DesktopExperienceTimeline(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopExperienceTimeline extends StatelessWidget {
  const _DesktopExperienceTimeline();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 2,
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.35),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.35),
                    blurRadius: 24,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            for (var i = 0; i < experiences.length; i++)
              _TimelineRow(
                experience: experiences[i],
                isLeft: i.isEven,
                isLast: i == experiences.length - 1,
              ),
          ],
        ),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final dynamic experience;
  final bool isLeft;
  final bool isLast;

  const _TimelineRow({
    required this.experience,
    required this.isLeft,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final card = _ExperienceTimelineCard(experience: experience);
    final year = _TimelineYear(year: experience.year);

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 48),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: isLeft ? card : year),
          const SizedBox(width: 36),
          const _TimelineNode(),
          const SizedBox(width: 36),
          Expanded(child: isLeft ? year : card),
        ],
      ),
    );
  }
}

class _MobileExperienceTimeline extends StatelessWidget {
  const _MobileExperienceTimeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < experiences.length; i++)
          Padding(
            padding: EdgeInsets.only(
              bottom: i == experiences.length - 1 ? 0 : 22,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const _TimelineNode(),
                    if (i != experiences.length - 1)
                      Container(
                        width: 2,
                        height: 120,
                        color: AppTheme.primary.withValues(alpha: 0.25),
                      ),
                  ],
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: _ExperienceTimelineCard(experience: experiences[i]),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _TimelineYear extends StatelessWidget {
  final String year;

  const _TimelineYear({required this.year});

  @override
  Widget build(BuildContext context) {
    return Text(
      year,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppTheme.textPrimary.withValues(alpha: 0.9),
        fontSize: 72,
        height: 1,
        fontWeight: FontWeight.w900,
        letterSpacing: -2,
      ),
    );
  }
}

class _TimelineNode extends StatelessWidget {
  const _TimelineNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.primary,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.65),
            blurRadius: 24,
            spreadRadius: 6,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _ExperienceTimelineCard extends StatelessWidget {
  final dynamic experience;

  const _ExperienceTimelineCard({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.title,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 26,
              height: 1.1,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            experience.organization,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            experience.description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 15.5,
              height: 1.6,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final tag in experience.tags)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
