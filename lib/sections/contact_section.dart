import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../utils/link_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 820;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppTheme.mobileHorizontalPadding
            : AppTheme.desktopHorizontalPadding,
        vertical: isMobile ? 72 : 110,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 28 : 44),
            decoration: BoxDecoration(
              color: AppTheme.surface.withValues(alpha: 0.94),
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              border: Border.all(color: AppTheme.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.24),
                  blurRadius: 44,
                  offset: const Offset(0, 28),
                ),
              ],
            ),
            child: isMobile
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ContactCopy(),
                      SizedBox(height: 32),
                      _ContactLinks(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 6, child: _ContactCopy()),
                      SizedBox(width: 56),
                      Expanded(flex: 4, child: _ContactLinks()),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _ContactCopy extends StatelessWidget {
  const _ContactCopy();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 520;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionEyebrow(text: 'CONTACT'),
        const SizedBox(height: 16),
        Text(
          'Let us build something useful.',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: isMobile ? 36 : 48,
            height: 1.05,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'I am open to product-focused tech roles, Flutter projects, and teams that care about shipping software people actually use.',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 18,
            height: 1.65,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 30),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _AvailabilityPill(text: 'Flutter'),
            _AvailabilityPill(text: 'Product Thinking'),
            _AvailabilityPill(text: 'Operations'),
            _AvailabilityPill(text: 'Bahrain / Remote'),
          ],
        ),
      ],
    );
  }
}

class _AvailabilityPill extends StatelessWidget {
  final String text;

  const _AvailabilityPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.border),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w800,
        ),
      ),
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
          icon: Icons.email_outlined,
          onTap: () => launchEmail('ma7moodfareed435@gmail.com'),
        ),
        const SizedBox(height: 14),
        _ContactLinkCard(
          label: 'GitHub',
          value: 'github.com/Mahmood-Sharif',
          icon: Icons.code,
          onTap: () => launchExternalUrl('https://github.com/Mahmood-Sharif'),
        ),
        const SizedBox(height: 14),
        _ContactLinkCard(
          label: 'LinkedIn',
          value: 'linkedin.com/in/mahmoodsharif/',
          icon: Icons.business_center_outlined,
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
  final IconData icon;
  final VoidCallback onTap;

  const _ContactLinkCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Material(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          hoverColor: AppTheme.primary.withValues(alpha: 0.08),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              border: Border.all(color: AppTheme.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                    border: Border.all(
                      color: AppTheme.primary.withValues(alpha: 0.22),
                    ),
                  ),
                  child: Icon(icon, color: AppTheme.primary, size: 21),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 15,
                          height: 1.35,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_outward,
                  color: AppTheme.primary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionEyebrow extends StatelessWidget {
  final String text;

  const _SectionEyebrow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppTheme.primary,
        fontSize: 13,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
