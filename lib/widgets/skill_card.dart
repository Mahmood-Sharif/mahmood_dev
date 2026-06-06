import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../data/skills_data.dart';
import 'hover_card.dart';

class SkillCard extends StatelessWidget {
  final SkillItem skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppTheme.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              skill.name,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              skill.category,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
