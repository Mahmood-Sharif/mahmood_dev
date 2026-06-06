import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../models/project.dart';
import '../utils/link_launcher.dart';
import 'hover_card.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isExpanded = false;

  Project get project => widget.project;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppTheme.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProjectHeader(project: project),
            const SizedBox(height: 18),
            Text(
              project.description,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 15.5,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Key work',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            ...project.highlights.map(
              (highlight) => _ProjectHighlight(text: highlight),
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              icon: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                size: 18,
              ),
              label: Text(isExpanded ? 'Hide details' : 'View details'),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: _ProjectDetails(project: project),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 220),
            ),
            Text(
              project.techStack,
              style: const TextStyle(
                color: AppTheme.primary,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            _ProjectActions(project: project),
          ],
        ),
      ),
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  final Project project;

  const _ProjectHeader({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          project.role,
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _ProjectHighlight extends StatelessWidget {
  final String text;

  const _ProjectHighlight({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '•',
            style: TextStyle(
              color: AppTheme.primary,
              fontSize: 18,
              height: 1.15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14.5,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectActions extends StatelessWidget {
  final Project project;

  const _ProjectActions({required this.project});

  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[
      if (project.githubUrl != null)
        _ProjectActionButton(
          label: 'GitHub',
          icon: Icons.code,
          onTap: () => launchExternalUrl(project.githubUrl!),
        ),
      if (project.liveUrl != null)
        _ProjectActionButton(
          label: 'Live',
          icon: Icons.open_in_new,
          onTap: () => launchExternalUrl(project.liveUrl!),
        ),
      if (project.caseStudyUrl != null)
        _ProjectActionButton(
          label: 'Case Study',
          icon: Icons.article_outlined,
          onTap: () => launchExternalUrl(project.caseStudyUrl!),
        ),
    ];

    if (actions.isEmpty) {
      return const Text(
        'Case study coming soon',
        style: TextStyle(
          color: AppTheme.textMuted,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      );
    }

    return Wrap(spacing: 10, runSpacing: 10, children: actions);
  }
}

class _ProjectActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ProjectActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 16),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.textPrimary,
          side: const BorderSide(color: AppTheme.border),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  final Project project;

  const _ProjectDetails({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Technical details',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          ...project.technicalDetails.map(
            (detail) => _ProjectHighlight(text: detail),
          ),
          const SizedBox(height: 12),
          const Text(
            'Outcome',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            project.outcome,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
