const skills = [
  SkillItem(name: 'Flutter', category: 'Mobile & Web UI'),
  SkillItem(name: 'Dart', category: 'App Development'),
  SkillItem(name: 'Supabase', category: 'Backend as a Service'),
  SkillItem(name: 'REST APIs', category: 'Integration'),
  SkillItem(name: 'Firebase', category: 'Backend as a Service'),
  SkillItem(name: 'Go', category: 'Backend Development'),
  SkillItem(name: 'JavaScript', category: 'Web Development'),
  SkillItem(name: 'SQLite', category: 'Database'),
  SkillItem(name: 'Git', category: 'Version Control'),
  SkillItem(name: 'Cloudflare', category: 'Deployment'),
];

class SkillItem {
  final String name;
  final String category;

  const SkillItem({required this.name, required this.category});
}
