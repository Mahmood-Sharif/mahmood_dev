import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app/app_theme.dart';
import '../data/skills_data.dart';

class SkillCard extends StatelessWidget {
  final SkillItem skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 116,
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.86),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.border.withValues(alpha: 0.9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                border: Border.all(color: AppTheme.border),
              ),
              child: SvgPicture.network(
                skill.iconUrl,
                placeholderBuilder: (_) => const SizedBox.shrink(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    skill.category,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                      height: 1.25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
