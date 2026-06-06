import 'package:flutter/material.dart';

void main() {
  runApp(const MahmoodPortfolioApp());
}

class MahmoodPortfolioApp extends StatelessWidget {
  const MahmoodPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahmood Sharif | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF38BDF8),
          brightness: Brightness.dark,
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final techKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(key: heroKey, child: const HeroSection()),
                  Container(key: aboutKey, child: const AboutSection()),
                  Container(key: techKey, child: const TechStackSection()),
                  Container(key: projectsKey, child: const ProjectsSection()),
                  Container(key: contactKey, child: const ContactSection()),
                ],
              ),
            ),
            PortfolioNavBar(
              onHeroTap: () => scrollToSection(heroKey),
              onAboutTap: () => scrollToSection(aboutKey),
              onTechTap: () => scrollToSection(techKey),
              onProjectsTap: () => scrollToSection(projectsKey),
              onContactTap: () => scrollToSection(contactKey),
            ),
          ],
        ),
      ),
    );
  }
}

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xCC0F172A),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: const Color(0xFF334155)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavItem(label: 'Home', onTap: onHeroTap),
              NavItem(label: 'About', onTap: onAboutTap),
              NavItem(label: 'Stack', onTap: onTechTap),
              NavItem(label: 'Projects', onTap: onProjectsTap),
              NavItem(label: 'Contact', onTap: onContactTap),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const NavItem({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFFE2E8F0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 96,
        vertical: isMobile ? 80 : 150,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mahmood Sharif',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF38BDF8),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Flutter Developer\n& Product Builder',
              style: TextStyle(
                fontSize: isMobile ? 44 : 72,
                height: 1.05,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: isMobile ? double.infinity : 650,
              child: const Text(
                'I build product-focused Flutter applications with clean UI, real business logic, API integrations, and a strong understanding of how software solves business problems.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.7,
                  color: Color(0xFFCBD5E1),
                ),
              ),
            ),
            const SizedBox(height: 36),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                FilledButton(
                  onPressed: null,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                    child: Text('View Projects'),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                    child: Text('Download CV'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PortfolioSection(
      title: 'About',
      child: Text(
        'I am a Flutter developer and software engineering learner at Reboot01 Bahrain. I have experience building startup products, full-stack projects, real-time systems, and business-focused applications. My strength is combining development with product thinking.',
        style: TextStyle(fontSize: 18, height: 1.7, color: Color(0xFFCBD5E1)),
      ),
    );
  }
}

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter',
      'Dart',
      'Supabase',
      'REST APIs',
      'Firebase',
      'Go',
      'JavaScript',
      'SQLite',
      'Git',
      'Cloudflare',
    ];

    return PortfolioSection(
      title: 'Tech Stack',
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: skills.map((skill) => SkillChip(label: skill)).toList(),
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: 'Jareb',
        description:
            'A reward-based discovery platform for cafés and restaurants, focused on verified visits, cashback drops, and merchant acquisition.',
        tech: 'Flutter, Supabase, Product Strategy',
      ),
      Project(
        title: 'Academity',
        description:
            'An academy management and subscription collection platform focused on operations, payments, and customer communication.',
        tech: 'Flutter, APIs, Payments',
      ),
      Project(
        title: 'Social Network',
        description:
            'A full-stack social network with authentication, profiles, posts, followers, privacy controls, notifications, and real-time messaging.',
        tech: 'Go, SQLite, WebSockets, React',
      ),
      Project(
        title: 'Real-Time Forum',
        description:
            'A forum app with authentication, posts, comments, private messages, typing indicators, and notifications.',
        tech: 'Go, JavaScript, WebSockets',
      ),
    ];

    return PortfolioSection(
      title: 'Featured Projects',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.25 : 1.45,
            ),
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          );
        },
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PortfolioSection(
      title: 'Contact',
      child: Text(
        'Open to Flutter Developer roles, product-focused engineering teams, and mobile app development opportunities.',
        style: TextStyle(fontSize: 18, height: 1.7, color: Color(0xFFCBD5E1)),
      ),
    );
  }
}

class PortfolioSection extends StatelessWidget {
  final String title;
  final Widget child;

  const PortfolioSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 96,
        vertical: 56,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 32 : 42,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFF1E293B),
      labelStyle: const TextStyle(color: Color(0xFFE2E8F0)),
      side: const BorderSide(color: Color(0xFF334155)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String tech;

  const Project({
    required this.title,
    required this.description,
    required this.tech,
  });
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            project.description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFFCBD5E1),
            ),
          ),
          const Spacer(),
          Text(
            project.tech,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF38BDF8),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
