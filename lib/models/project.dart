class Project {
  final String title;
  final String description;
  final String role;
  final String techStack;
  final List<String> highlights;
  final String? githubUrl;
  final String? liveUrl;
  final String? caseStudyUrl;

  const Project({
    required this.title,
    required this.description,
    required this.role,
    required this.techStack,
    required this.highlights,
    this.githubUrl,
    this.liveUrl,
    this.caseStudyUrl,
  });
}
