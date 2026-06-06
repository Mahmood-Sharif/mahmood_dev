import 'package:flutter/material.dart';

import '../sections/selected_work_section.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/tech_stack_section.dart';
import '../sections/experience_section.dart';
import '../widgets/footer.dart';
import '../widgets/page_background.dart';
import '../utils/link_launcher.dart';
import '../widgets/nav_bar.dart';
import 'app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahmood Sharif | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
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
    final sectionContext = key.currentContext;
    if (sectionContext == null) return;

    Scrollable.ensureVisible(
      sectionContext,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageBackground(
        child: SelectionArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      key: heroKey,
                      child: HeroSection(
                        onViewProjectsTap: () => scrollToSection(projectsKey),
                        onDownloadCvTap: () =>
                            launchAsset('documents/mahmood_sharif_cv.pdf'),
                      ),
                    ),
                    Container(
                      key: aboutKey,
                      child: const SelectedWorkSection(),
                    ),
                    const ExperienceSection(),
                    Container(key: techKey, child: const TechStackSection()),
                    Container(key: projectsKey, child: const ProjectsSection()),
                    Container(key: contactKey, child: const ContactSection()),
                    const PortfolioFooter(),
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
      ),
    );
  }
}
