import 'package:flutter/material.dart';

import '../app/app_theme.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 820;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppTheme.mobileHorizontalPadding
            : AppTheme.desktopHorizontalPadding,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.border.withValues(alpha: 0.72)),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: isMobile
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FooterBrand(),
                    SizedBox(height: 10),
                    _FooterText(),
                  ],
                )
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_FooterBrand(), _FooterText()],
                ),
        ),
      ),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  const _FooterBrand();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Mahmood Sharif',
      style: TextStyle(
        color: AppTheme.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class _FooterText extends StatelessWidget {
  const _FooterText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Built with Flutter Web - ${DateTime.now().year}',
      style: const TextStyle(
        color: AppTheme.textMuted,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
