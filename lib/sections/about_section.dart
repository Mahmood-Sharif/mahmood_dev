import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../widgets/portfolio_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioSection(
      eyebrow: 'ABOUT',
      title: 'I build Flutter apps with product logic, not just screens.',
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
      'I am a Flutter developer based in Bahrain, currently building real products while completing software engineering training at Reboot01.\n\nMy focus is building clean, responsive Flutter interfaces connected to real backend logic — authentication, APIs, databases, payments, real-time features, and product flows. I care about writing code that supports the user journey and the business goal behind the feature.',
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
          title: 'Flutter-focused',
          description:
              'I build responsive Flutter UIs and structure features into reusable widgets and clean sections.',
        ),
        SizedBox(height: 14),
        _HighlightCard(
          title: 'Backend-aware',
          description:
              'I understand APIs, Supabase, Go backends, SQLite, WebSockets, and how frontend flows connect to data.',
        ),
        SizedBox(height: 14),
        _HighlightCard(
          title: 'Product-minded',
          description:
              'I think through user journeys, business requirements, and why each feature should exist.',
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
