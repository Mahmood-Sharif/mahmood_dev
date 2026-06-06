import 'package:flutter/material.dart';

import '../data/skills_data.dart';
import '../widgets/portfolio_section.dart';
import '../widgets/skill_card.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioSection(
      eyebrow: 'STACK',
      title: 'Tools I use to build real products.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          final isTablet = constraints.maxWidth < 1000;

          if (isMobile) {
            return Column(
              children: skills
                  .map(
                    (skill) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: SkillCard(skill: skill),
                    ),
                  )
                  .toList(),
            );
          }

          return GridView.builder(
            itemCount: skills.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 2 : 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.7,
            ),
            itemBuilder: (context, index) {
              return SkillCard(skill: skills[index]);
            },
          );
        },
      ),
    );
  }
}
