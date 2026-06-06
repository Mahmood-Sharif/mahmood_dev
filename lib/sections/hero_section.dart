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
          'Mahmood Sharif · Software Engineer',
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I turn business problems into working apps.',
          style: TextStyle(
            fontSize: isMobile ? 38 : 56,
            height: 1.05,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -1.2,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'I combine business thinking and development to turn messy ideas into simple digital products.',
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
                child: Text('See My Work'),
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
        const SizedBox(height: 22),
        const Text(
          'Flutter · Dart · Supabase · Go · APIs · Product Thinking',
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
            height: 1.5,
            fontWeight: FontWeight.w600,
          ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _HeroIdentity(),
          SizedBox(height: 28),
          Text(
            'How I work',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textMuted,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          _BuilderProofItem(
            number: '01',
            title: 'Find slow industries',
            description: 'Manual work, WhatsApp, Excel, outdated systems.',
          ),
          _BuilderProofItem(
            number: '02',
            title: 'Study proven models',
            description: 'Research what already works in other markets.',
          ),
          _BuilderProofItem(
            number: '03',
            title: 'Localize for GCC',
            description: 'Adapt the idea to Bahrain/GCC behavior and needs.',
          ),
          _BuilderProofItem(
            number: '04',
            title: 'Build the MVP',
            description: 'Turn the idea into a simple working product.',
          ),
          // SizedBox(height: 28),
          // _HeroMetric(label: 'Main Stack', value: 'Flutter / Dart'),
          // _HeroMetric(label: 'Backend', value: 'Supabase / APIs / Go'),
          // _HeroMetric(label: 'Based in', value: 'Bahrain'),
        ],
      ),
    );
  }
}

class _HeroIdentity extends StatelessWidget {
  const _HeroIdentity();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primary, width: 2),
            image: const DecorationImage(
              image: AssetImage('assets/images/mahmood_profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mahmood Sharif',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Software Engineer · Bahrain',
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BuilderProofItem extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _BuilderProofItem({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13.5,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class _StatusBadge extends StatelessWidget {
//   const _StatusBadge();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//       decoration: BoxDecoration(
//         color: AppTheme.primary.withValues(alpha: 0.12),
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(color: AppTheme.primary.withValues(alpha: 0.35)),
//       ),
//       child: const Text(
//         'Open to Flutter roles',
//         style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w700),
//       ),
//     );
//   }
// }

// class _HeroMetric extends StatelessWidget {
//   final String label;
//   final String value;

//   const _HeroMetric({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 18),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 color: AppTheme.textMuted,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(
//                 color: AppTheme.textPrimary,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
