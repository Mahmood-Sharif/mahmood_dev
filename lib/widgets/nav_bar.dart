import 'dart:ui';

import 'package:flutter/material.dart';

import '../app/app_theme.dart';

class PortfolioNavBar extends StatelessWidget {
  final VoidCallback onHeroTap;
  final VoidCallback onAboutTap;
  final VoidCallback onTechTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const PortfolioNavBar({
    super.key,
    required this.onHeroTap,
    required this.onAboutTap,
    required this.onTechTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 820;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? AppTheme.mobileHorizontalPadding
                  : AppTheme.desktopHorizontalPadding,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: AppTheme.background.withValues(alpha: 0.78),
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.border.withValues(alpha: 0.65),
                ),
              ),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppTheme.maxContentWidth,
                ),
                child: isMobile
                    ? _MobileNavButton(
                        onHeroTap: onHeroTap,
                        onAboutTap: onAboutTap,
                        onTechTap: onTechTap,
                        onProjectsTap: onProjectsTap,
                        onContactTap: onContactTap,
                      )
                    : _DesktopNavBar(
                        onHeroTap: onHeroTap,
                        onAboutTap: onAboutTap,
                        onTechTap: onTechTap,
                        onProjectsTap: onProjectsTap,
                        onContactTap: onContactTap,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DesktopNavBar extends StatelessWidget {
  final VoidCallback onHeroTap;
  final VoidCallback onAboutTap;
  final VoidCallback onTechTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _DesktopNavBar({
    required this.onHeroTap,
    required this.onAboutTap,
    required this.onTechTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onHeroTap,
            child: const Text(
              'Mahmood Sharif',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Flutter - Product - Operations',
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        _NavItem(label: 'Home', onTap: onHeroTap),
        _NavItem(label: 'Work', onTap: onAboutTap),
        _NavItem(label: 'Experience', onTap: onProjectsTap),
        _NavItem(label: 'Stack', onTap: onTechTap),
        _NavItem(label: 'Contact', onTap: onContactTap),
      ],
    );
  }
}

class _MobileNavButton extends StatelessWidget {
  final VoidCallback onHeroTap;
  final VoidCallback onAboutTap;
  final VoidCallback onTechTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _MobileNavButton({
    required this.onHeroTap,
    required this.onAboutTap,
    required this.onTechTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  void _openMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.cardRadius),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MobileNavItem(
                  label: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                    onHeroTap();
                  },
                ),
                _MobileNavItem(
                  label: 'Work',
                  onTap: () {
                    Navigator.pop(context);
                    onAboutTap();
                  },
                ),
                _MobileNavItem(
                  label: 'Experience',
                  onTap: () {
                    Navigator.pop(context);
                    onProjectsTap();
                  },
                ),
                _MobileNavItem(
                  label: 'Stack',
                  onTap: () {
                    Navigator.pop(context);
                    onTechTap();
                  },
                ),
                _MobileNavItem(
                  label: 'Contact',
                  onTap: () {
                    Navigator.pop(context);
                    onContactTap();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Mahmood Sharif',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        Material(
          color: AppTheme.surfaceElevated,
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          child: InkWell(
            onTap: () => _openMenu(context),
            borderRadius: BorderRadius.circular(AppTheme.cardRadius),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                border: Border.all(color: AppTheme.border),
              ),
              child: const Icon(Icons.menu, color: AppTheme.textPrimary),
            ),
          ),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.textPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _MobileNavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward, color: AppTheme.primary),
    );
  }
}
