import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../data/skills_data.dart';
import '../widgets/skill_card.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

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
              const _SectionEyebrow(text: 'TOOLBOX'),
              const SizedBox(height: 14),
              Text(
                'The stack behind the work.',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: isMobile ? 36 : 56,
                  height: 1.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: 720,
                child: Text(
                  'A focused toolkit for app interfaces, backend logic, validation loops, deployment, and practical product delivery.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 18,
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: skills
                    .map((skill) => SkillCard(skill: skill))
                    .toList(),
              ),
            ],
          ),
        ),
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
