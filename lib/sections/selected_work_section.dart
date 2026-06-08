import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../data/selected_work_data.dart';
import '../widgets/selected_work_card.dart';

class SelectedWorkSection extends StatefulWidget {
  const SelectedWorkSection({super.key});

  @override
  State<SelectedWorkSection> createState() => _SelectedWorkSectionState();
}

class _SelectedWorkSectionState extends State<SelectedWorkSection> {
  final ScrollController _scrollController = ScrollController();

  bool _canScrollLeft = false;
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollButtons);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollButtons);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollButtons() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;

    setState(() {
      _canScrollLeft = position.pixels > position.minScrollExtent + 8;
      _canScrollRight = position.pixels < position.maxScrollExtent - 8;
    });
  }

  void _scrollWorkCards(double offset) {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    final target = (_scrollController.offset + offset).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppTheme.mobileHorizontalPadding
            : AppTheme.desktopHorizontalPadding,
        vertical: isMobile ? 62 : 94,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionEyebrow(text: 'SELECTED WORK'),
              const SizedBox(height: 12),
              _SelectedWorkHeader(
                isMobile: isMobile,
                onPreviousTap: () => _scrollWorkCards(-984),
                onNextTap: () => _scrollWorkCards(984),
                canScrollLeft: _canScrollLeft,
                canScrollRight: _canScrollRight,
              ),
              const SizedBox(height: 18),
              const SizedBox(
                width: 720,
                child: Text(
                  'The proof I would look for as a CTO: product judgment, ownership, execution, and a clear reason each thing exists.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 18,
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                  ),
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
                  height: 584,
                  child: ListView.separated(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedWorks.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 24),
                    itemBuilder: (context, index) {
                      return SelectedWorkCard(work: selectedWorks[index]);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectedWorkHeader extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onPreviousTap;
  final VoidCallback onNextTap;
  final bool canScrollLeft;
  final bool canScrollRight;

  const _SelectedWorkHeader({
    required this.isMobile,
    required this.onPreviousTap,
    required this.onNextTap,
    required this.canScrollLeft,
    required this.canScrollRight,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return const Text(
        'Ideas turned into working products.',
        style: TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 36,
          height: 1.05,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Expanded(
          child: Text(
            'Ideas turned into working products.',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 56,
              height: 1.05,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 24),
        Row(
          children: [
            _ArrowButton(
              icon: Icons.arrow_back,
              onTap: onPreviousTap,
              isEnabled: canScrollLeft,
            ),
            const SizedBox(width: 12),
            _ArrowButton(
              icon: Icons.arrow_forward,
              onTap: onNextTap,
              isEnabled: canScrollRight,
            ),
          ],
        ),
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isEnabled;

  const _ArrowButton({
    required this.icon,
    required this.onTap,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: Material(
        color: isEnabled
            ? AppTheme.surfaceElevated
            : AppTheme.surface.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        child: InkWell(
          onTap: isEnabled ? onTap : null,
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              border: Border.all(
                color: isEnabled
                    ? AppTheme.primary.withValues(alpha: 0.75)
                    : AppTheme.border,
              ),
            ),
            child: Icon(
              icon,
              color: isEnabled ? AppTheme.primary : AppTheme.textMuted,
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
