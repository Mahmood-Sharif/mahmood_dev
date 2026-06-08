import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../utils/link_launcher.dart';

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
    final isMobile = MediaQuery.sizeOf(context).width < 820;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        isMobile
            ? AppTheme.mobileHorizontalPadding
            : AppTheme.desktopHorizontalPadding,
        isMobile ? 112 : 132,
        isMobile
            ? AppTheme.mobileHorizontalPadding
            : AppTheme.desktopHorizontalPadding,
        isMobile ? 64 : 92,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroContent(
                      onViewProjectsTap: onViewProjectsTap,
                      onDownloadCvTap: onDownloadCvTap,
                    ),
                    const SizedBox(height: 34),
                    const _HeroProofPanel(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _HeroContent(
                        onViewProjectsTap: onViewProjectsTap,
                        onDownloadCvTap: onDownloadCvTap,
                      ),
                    ),
                    const SizedBox(width: 56),
                    const Expanded(flex: 5, child: _HeroProofPanel()),
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
    final isMobile = MediaQuery.sizeOf(context).width < 820;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusLine(),
        const SizedBox(height: 18),
        Text(
          'I build polished Flutter products for real business problems.',
          style: TextStyle(
            fontSize: isMobile ? 42 : 68,
            height: 1.02,
            fontWeight: FontWeight.w900,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 24),
        const SizedBox(
          width: 650,
          child: Text(
            'Product-minded developer from Bahrain with a business-first approach: I turn messy workflows into fast, usable apps, admin portals, payments, reminders, and validation systems.',
            style: TextStyle(
              fontSize: 18,
              height: 1.65,
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: onViewProjectsTap,
              icon: const Icon(Icons.layers_outlined, size: 18),
              label: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                child: Text('Review selected work'),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onDownloadCvTap,
              icon: const Icon(Icons.description_outlined, size: 18),
              label: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                child: Text('Download CV'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _HeroChip(text: 'Flutter'),
            _HeroChip(text: 'Dart'),
            _HeroChip(text: 'Supabase'),
            _HeroChip(text: 'Go'),
            _HeroChip(text: 'Payments'),
            _HeroChip(text: 'Operations'),
          ],
        ),
      ],
    );
  }
}

class _StatusLine extends StatelessWidget {
  const _StatusLine();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 10,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _StatusPill(text: 'Mahmood Sharif'),
        Text(
          'Product-minded Developer - Bahrain',
          style: TextStyle(
            color: AppTheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String text;

  const _StatusPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: AppTheme.accent.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.42)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 13,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _HeroChip extends StatelessWidget {
  final String text;

  const _HeroChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.78),
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

class _HeroProofPanel extends StatelessWidget {
  const _HeroProofPanel();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 520;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.30),
            blurRadius: 42,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: isMobile ? 1.05 : 1.18,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppTheme.cardRadius),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/mahmood_profile.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppTheme.background.withValues(alpha: 0.72),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 18,
                    right: 18,
                    bottom: 18,
                    child: _AvailabilityBadge(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 20 : 24),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PanelHeader(),
                SizedBox(height: 22),
                _HeroStatsGrid(),
                SizedBox(height: 18),
                _HeroSocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  const _AvailabilityBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.76),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
      ),
      child: const Row(
        children: [
          Icon(Icons.work_outline, color: AppTheme.success, size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Open to product-focused Flutter roles and teams building useful software.',
              style: TextStyle(
                color: AppTheme.textSecondary,
                height: 1.35,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PanelHeader extends StatelessWidget {
  const _PanelHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Candidate signal',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Strong fit for teams that need someone who can think through the product, build the interface, and understand the operation behind it.',
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
            height: 1.55,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _HeroStatsGrid extends StatelessWidget {
  const _HeroStatsGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth < 360 ? 1 : 2;
        return GridView.count(
          crossAxisCount: columns,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: columns == 1 ? 3.3 : 1.65,
          children: const [
            _HeroStatCard(value: '3+', label: 'Products shaped'),
            _HeroStatCard(value: 'BSc ICT', label: 'Tech foundation'),
            _HeroStatCard(value: 'Flutter', label: 'Primary stack'),
            _HeroStatCard(value: 'GCC', label: 'Market context'),
          ],
        );
      },
    );
  }
}

class _HeroStatCard extends StatelessWidget {
  final String value;
  final String label;

  const _HeroStatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.62),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 24,
              height: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              height: 1.25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSocialLinks extends StatelessWidget {
  const _HeroSocialLinks();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _HeroSocialButton(
          icon: Icons.code,
          label: 'GitHub',
          url: 'https://github.com/Mahmood-Sharif',
        ),
        SizedBox(width: 10),
        _HeroSocialButton(
          icon: Icons.business_center_outlined,
          label: 'LinkedIn',
          url: 'https://www.linkedin.com/in/mahmoodsharif/',
        ),
        SizedBox(width: 10),
        _HeroSocialButton(
          icon: Icons.email_outlined,
          label: 'Email',
          email: 'ma7moodfareed435@gmail.com',
        ),
      ],
    );
  }
}

class _HeroSocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? url;
  final String? email;

  const _HeroSocialButton({
    required this.icon,
    required this.label,
    this.url,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Material(
          color: AppTheme.surfaceElevated,
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          child: InkWell(
            onTap: () {
              if (email != null) {
                launchEmail(email!);
              } else if (url != null) {
                launchExternalUrl(url!);
              }
            },
            borderRadius: BorderRadius.circular(AppTheme.cardRadius),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                border: Border.all(color: AppTheme.border),
              ),
              child: Tooltip(
                message: label,
                child: Icon(icon, size: 18, color: AppTheme.textPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
