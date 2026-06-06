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
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Positioned(
      top: 24,
      left: 0,
      right: 0,
      child: Center(
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _NavItem(label: 'Home', onTap: onHeroTap),
          _NavItem(label: 'Work', onTap: onAboutTap),
          _NavItem(label: 'Stack', onTap: onTechTap),
          _NavItem(label: 'Contact', onTap: onContactTap),
        ],
      ),
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
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
                  label: 'Stack',
                  onTap: () {
                    Navigator.pop(context);
                    onTechTap();
                  },
                ),
                _MobileNavItem(
                  label: 'Projects',
                  onTap: () {
                    Navigator.pop(context);
                    onProjectsTap();
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
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Material(
          color: AppTheme.background.withValues(alpha: 0.88),
          borderRadius: BorderRadius.circular(999),
          child: InkWell(
            onTap: () => _openMenu(context),
            borderRadius: BorderRadius.circular(999),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: AppTheme.border),
              ),
              child: const Icon(Icons.menu, color: AppTheme.textPrimary),
            ),
          ),
        ),
      ),
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
      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
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
