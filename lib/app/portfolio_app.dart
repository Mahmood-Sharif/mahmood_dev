import 'package:flutter/material.dart';

import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/hero_section.dart';
import '../sections/selected_work_section.dart';
import '../sections/tech_stack_section.dart';
import '../utils/link_launcher.dart';
import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';
import '../widgets/page_background.dart';
import 'app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahmood Sharif | Product-minded Developer',
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
  final homeKey = GlobalKey();
  final workKey = GlobalKey();
  final experienceKey = GlobalKey();
  final stackKey = GlobalKey();
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
                      key: homeKey,
                      child: HeroSection(
                        onViewProjectsTap: () => scrollToSection(workKey),
                        onDownloadCvTap: () => launchWebDocument(
                          'documents/mahmood_sharif_cv.pdf',
                        ),
                      ),
                    ),
                    Container(key: workKey, child: const SelectedWorkSection()),
                    Container(
                      key: experienceKey,
                      child: const ExperienceSection(),
                    ),
                    Container(key: stackKey, child: const TechStackSection()),
                    Container(key: contactKey, child: const ContactSection()),
                    const PortfolioFooter(),
                  ],
                ),
              ),
              PortfolioNavBar(
                onHeroTap: () => scrollToSection(homeKey),
                onAboutTap: () => scrollToSection(workKey),
                onProjectsTap: () => scrollToSection(experienceKey),
                onTechTap: () => scrollToSection(stackKey),
                onContactTap: () => scrollToSection(contactKey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
