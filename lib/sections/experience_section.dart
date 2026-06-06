import 'package:flutter/material.dart';

import '../data/experience_data.dart';
import '../widgets/experience_card.dart';
import '../widgets/portfolio_section.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioSection(
      eyebrow: 'EXPERIENCE',
      title: 'A builder path shaped by real projects.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          if (isMobile) {
            return Column(
              children: experiences
                  .map(
                    (experience) => Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: ExperienceCard(experience: experience),
                    ),
                  )
                  .toList(),
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: experiences
                .map(
                  (experience) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: ExperienceCard(experience: experience),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
