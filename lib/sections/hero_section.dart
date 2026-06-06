import 'package:flutter/material.dart';

import '../app/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjectsTap;
  final VoidCallback onDownloadCvTap;

  const HeroSection({
    super.key,
    required this.onViewProjectsTap,
    required this.onDownloadCvTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppTheme.mobileHorizontalPadding
            : AppTheme.desktopHorizontalPadding,
        vertical: isMobile ? 96 : 150,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: isMobile
              ? _HeroContent(
                  onViewProjectsTap: onViewProjectsTap,
                  onDownloadCvTap: onDownloadCvTap,
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: _HeroContent(
                        onViewProjectsTap: onViewProjectsTap,
                        onDownloadCvTap: onDownloadCvTap,
                      ),
                    ),
                    SizedBox(width: 56),
                    Expanded(flex: 4, child: _HeroProfileCard()),
                  ],
                ),
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  final VoidCallback onViewProjectsTap;
  final VoidCallback onDownloadCvTap;

  const _HeroContent({
    required this.onViewProjectsTap,
    required this.onDownloadCvTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mahmood Sharif',
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Flutter Developer\n& Product Builder',
          style: TextStyle(
            fontSize: isMobile ? 40 : 72,
            height: 1.05,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -1.2,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'I build product-focused Flutter applications with clean UI, real business logic, API integrations, and a strong understanding of how software solves business problems.',
          style: TextStyle(
            fontSize: 18,
            height: 1.7,
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            FilledButton(
              onPressed: onViewProjectsTap,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                child: Text('View Projects'),
              ),
            ),
            OutlinedButton(
              onPressed: onDownloadCvTap,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                child: Text('Download CV'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroProfileCard extends StatelessWidget {
  const _HeroProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 32,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatusBadge(),
          SizedBox(height: 28),
          Text(
            'Current Focus',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Building Flutter apps that connect product, design, backend logic, and real business needs.',
            style: TextStyle(
              fontSize: 24,
              height: 1.35,
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 28),
          _HeroMetric(label: 'Main Stack', value: 'Flutter / Dart'),
          _HeroMetric(label: 'Location', value: 'Bahrain'),
          _HeroMetric(label: 'Strength', value: 'Product + Engineering'),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.35)),
      ),
      child: const Text(
        'Open to Flutter roles',
        style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  final String label;
  final String value;

  const _HeroMetric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
