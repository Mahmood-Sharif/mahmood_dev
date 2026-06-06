import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../widgets/portfolio_section.dart';
import '../utils/link_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioSection(
      eyebrow: 'CONTACT',
      title: 'Let’s build something useful.',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppTheme.border),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 800;

            return isMobile
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ContactCopy(),
                      SizedBox(height: 28),
                      _ContactLinks(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 6, child: _ContactCopy()),
                      SizedBox(width: 48),
                      Expanded(flex: 4, child: _ContactLinks()),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class _ContactCopy extends StatelessWidget {
  const _ContactCopy();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Open to Flutter Developer roles.',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 28,
            height: 1.2,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'I am looking for teams where I can build Flutter apps, work with APIs, improve product flows, and contribute beyond just UI implementation.',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 17,
            height: 1.65,
          ),
        ),
      ],
    );
  }
}

class _ContactLinks extends StatelessWidget {
  const _ContactLinks();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ContactLinkCard(
          label: 'Email',
          value: 'ma7moodfareed435@gmail.com',
          onTap: () => launchEmail('ma7moodfareed435@gmail.com'),
        ),
        const SizedBox(height: 14),
        _ContactLinkCard(
          label: 'GitHub',
          value: 'github.com/Mahmood-Sharif',
          onTap: () => launchExternalUrl('https://github.com/Mahmood-Sharif'),
        ),
        const SizedBox(height: 14),
        _ContactLinkCard(
          label: 'LinkedIn',
          value: 'linkedin.com/in/mahmoodsharif/',
          onTap: () =>
              launchExternalUrl('https://www.linkedin.com/in/mahmoodsharif/'),
        ),
      ],
    );
  }
}

class _ContactLinkCard extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactLinkCard({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Material(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          hoverColor: AppTheme.primary.withValues(alpha: 0.08),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppTheme.border),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        value,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 15,
                          height: 1.4,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.open_in_new,
                  size: 18,
                  color: AppTheme.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
