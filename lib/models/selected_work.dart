class SelectedWork {
  final String number;
  final String title;
  final String category;
  final String description;
  final String role;
  final List<String> tools;
  final String visualLabel;
  final String ctaLabel;
  final String? url;

  const SelectedWork({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.role,
    required this.tools,
    required this.visualLabel,
    required this.ctaLabel,
    this.url,
  });
}
