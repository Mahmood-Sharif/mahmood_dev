import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../data/selected_work_data.dart';
import '../widgets/selected_work_card.dart';

class SelectedWorkSection extends StatelessWidget {
  const SelectedWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppTheme.mobileHorizontalPadding
            : AppTheme.desktopHorizontalPadding,
        vertical: isMobile ? 64 : 92,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SELECTED WORK',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Proof that I can turn ideas into products.',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: isMobile ? 36 : 56,
                  height: 1.05,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'A short journey through the products and systems I’ve worked on.',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 18,
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 42),
              if (isMobile)
                Column(
                  children: selectedWorks
                      .map(
                        (work) => Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: SelectedWorkCard(work: work),
                        ),
                      )
                      .toList(),
                )
              else
                SizedBox(
                  height: 520,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedWorks.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 24),
                    itemBuilder: (context, index) {
                      return SelectedWorkCard(work: selectedWorks[index]);
                    },
                  ),
                ),
              if (!isMobile) ...[
                const SizedBox(height: 18),
                const Text(
                  'Scroll horizontally to explore →',
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
