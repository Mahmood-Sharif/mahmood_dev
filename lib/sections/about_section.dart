import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../widgets/portfolio_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioSection(
      eyebrow: 'ABOUT',
      title: 'I build like a developer, but think like an operator.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          return isMobile
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AboutText(),
                    SizedBox(height: 24),
                    _AboutHighlights(),
                  ],
                )
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 6, child: _AboutText()),
                    SizedBox(width: 48),
                    Expanded(flex: 4, child: _AboutHighlights()),
                  ],
                );
        },
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'I am a Flutter developer and software engineering learner at Reboot01 Bahrain. I focus on building practical applications with clean interfaces, backend-connected features, and real product logic.\n\nMy background includes startup execution, full-stack projects, and product validation. That means I do not only care about how the screen looks — I care about whether the software solves the actual business problem.',
      style: TextStyle(
        fontSize: 18,
        height: 1.75,
        color: AppTheme.textSecondary,
      ),
    );
  }
}

class _AboutHighlights extends StatelessWidget {
  const _AboutHighlights();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _HighlightCard(
          title: 'Product-minded',
          description:
              'I understand users, business requirements, and why a feature matters.',
        ),
        SizedBox(height: 14),
        _HighlightCard(
          title: 'Full-stack aware',
          description:
              'Comfortable working with APIs, Supabase, Go backends, SQLite, and real-time systems.',
        ),
        SizedBox(height: 14),
        _HighlightCard(
          title: 'Execution-focused',
          description:
              'I care about shipping working products, not just writing code in isolation.',
        ),
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final String title;
  final String description;

  const _HighlightCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
            title,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 15,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}
