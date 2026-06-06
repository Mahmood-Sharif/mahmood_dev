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

    if (isMobile) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: 24,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
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
              _NavItem(label: 'About', onTap: onAboutTap),
              _NavItem(label: 'Stack', onTap: onTechTap),
              _NavItem(label: 'Projects', onTap: onProjectsTap),
              _NavItem(label: 'Contact', onTap: onContactTap),
            ],
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
