import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../data/experience_data.dart';
import '../models/experience.dart';

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
        vertical: isMobile ? 64 : 110,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionEyebrow(text: 'EXPERIENCE'),
              const SizedBox(height: 14),
              Text(
                'The builder arc.',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: isMobile ? 38 : 64,
                  height: 1.02,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 18),
              const SizedBox(
                width: 720,
                child: Text(
                  'A practical path from technical foundation to shipped systems, business workflows, and product validation.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 18,
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 44 : 76),
              isMobile
                  ? const _MobileExperienceTimeline()
                  : const _CinematicExperienceTimeline(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CinematicExperienceTimeline extends StatelessWidget {
  const _CinematicExperienceTimeline();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: Center(child: _TimelineSpine())),
        Column(
          children: [
            for (var i = 0; i < experiences.length; i++)
              _ExperienceTimelineRow(
                experience: experiences[i],
                isReversed: i.isOdd,
                isLast: i == experiences.length - 1,
                isHighlighted: i == experiences.length - 1,
              ),
          ],
        ),
      ],
    );
  }
}

class _ExperienceTimelineRow extends StatelessWidget {
  final Experience experience;
  final bool isReversed;
  final bool isLast;
  final bool isHighlighted;

  const _ExperienceTimelineRow({
    required this.experience,
    required this.isReversed,
    required this.isLast,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    final stageCard = _ExperienceStageCard(
      experience: experience,
      isHighlighted: isHighlighted,
    );

    final detailCard = _ExperienceDetailCard(
      experience: experience,
      isHighlighted: isHighlighted,
    );

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 64),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: isReversed ? detailCard : stageCard),
          const SizedBox(width: 34),
          _YearNode(year: experience.year, isHighlighted: isHighlighted),
          const SizedBox(width: 34),
          Expanded(flex: 5, child: isReversed ? stageCard : detailCard),
        ],
      ),
    );
  }
}

class _TimelineSpine extends StatelessWidget {
  const _TimelineSpine();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primary.withValues(alpha: 0.22),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.35),
            blurRadius: 30,
            spreadRadius: 4,
          ),
        ],
      ),
    );
  }
}

class _YearNode extends StatelessWidget {
  final String year;
  final bool isHighlighted;

  const _YearNode({required this.year, required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Text(
            year,
            style: TextStyle(
              color: isHighlighted
                  ? AppTheme.primary
                  : AppTheme.textPrimary.withValues(alpha: 0.9),
              fontSize: isHighlighted ? 58 : 52,
              height: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: isHighlighted ? 30 : 22,
            height: isHighlighted ? 30 : 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primary,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primary.withValues(
                    alpha: isHighlighted ? 0.85 : 0.55,
                  ),
                  blurRadius: isHighlighted ? 42 : 24,
                  spreadRadius: isHighlighted ? 12 : 5,
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: isHighlighted ? 10 : 8,
                height: isHighlighted ? 10 : 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceStageCard extends StatelessWidget {
  final Experience experience;
  final bool isHighlighted;

  const _ExperienceStageCard({
    required this.experience,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isHighlighted
            ? AppTheme.primary.withValues(alpha: 0.10)
            : AppTheme.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(
          color: isHighlighted
              ? AppTheme.primary.withValues(alpha: 0.55)
              : AppTheme.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.organization,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            experience.title,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 32,
              height: 1.05,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceDetailCard extends StatelessWidget {
  final Experience experience;
  final bool isHighlighted;

  const _ExperienceDetailCard({
    required this.experience,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: isHighlighted ? 1 : 0.82),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(
          color: isHighlighted
              ? AppTheme.primary.withValues(alpha: 0.45)
              : AppTheme.border,
        ),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: AppTheme.primary.withValues(alpha: 0.12),
                  blurRadius: 40,
                  offset: const Offset(0, 18),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 17,
              height: 1.65,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final tag in experience.tags)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
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

class _MobileExperienceTimeline extends StatelessWidget {
  const _MobileExperienceTimeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < experiences.length; i++)
          Padding(
            padding: EdgeInsets.only(
              bottom: i == experiences.length - 1 ? 0 : 24,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    _MobileTimelineNode(
                      isHighlighted: i == experiences.length - 1,
                    ),
                    if (i != experiences.length - 1)
                      Container(
                        width: 2,
                        height: 180,
                        color: AppTheme.primary.withValues(alpha: 0.22),
                      ),
                  ],
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: _MobileTimelineCard(
                    experience: experiences[i],
                    isHighlighted: i == experiences.length - 1,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _MobileTimelineNode extends StatelessWidget {
  final bool isHighlighted;

  const _MobileTimelineNode({required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHighlighted ? 28 : 22,
      height: isHighlighted ? 28 : 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.primary,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.65),
            blurRadius: isHighlighted ? 32 : 22,
            spreadRadius: isHighlighted ? 8 : 4,
          ),
        ],
      ),
    );
  }
}

class _MobileTimelineCard extends StatelessWidget {
  final Experience experience;
  final bool isHighlighted;

  const _MobileTimelineCard({
    required this.experience,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(
          color: isHighlighted
              ? AppTheme.primary.withValues(alpha: 0.5)
              : AppTheme.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.year,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            experience.title,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 24,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            experience.organization,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            experience.description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 15.5,
              height: 1.55,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
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
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
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

class _SectionEyebrow extends StatelessWidget {
  final String text;

  const _SectionEyebrow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppTheme.primary,
        fontSize: 13,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
