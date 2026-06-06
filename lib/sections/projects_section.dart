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

          return GridView.builder(
            itemCount: projects.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 0.92 : 0.95,
            ),
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          );
        },
      ),
    );
  }
}
