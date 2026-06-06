import 'package:flutter/material.dart';

import '../data/projects_data.dart';
import '../widgets/portfolio_section.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioSection(
      eyebrow: 'PROJECTS',
      title: 'Selected work that proves I can build.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;
          final cardWidth = isMobile
              ? constraints.maxWidth
              : (constraints.maxWidth - 20) / 2;

          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: projects
                .map(
                  (project) => SizedBox(
                    width: cardWidth,
                    child: ProjectCard(project: project),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
