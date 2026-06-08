class SkillItem {
  final String name;
  final String category;
  final String iconUrl;

  const SkillItem({
    required this.name,
    required this.category,
    required this.iconUrl,
  });
}

const skills = [
  SkillItem(
    name: 'Flutter',
    category: 'UI',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
  ),
  SkillItem(
    name: 'Dart',
    category: 'Language',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg',
  ),
  SkillItem(
    name: 'Supabase',
    category: 'Backend',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/supabase/supabase-original.svg',
  ),
  SkillItem(
    name: 'Go',
    category: 'Backend',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/go/go-original.svg',
  ),
  SkillItem(
    name: 'JavaScript',
    category: 'Web',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg',
  ),
  SkillItem(
    name: 'SQLite',
    category: 'Database',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sqlite/sqlite-original.svg',
  ),
  SkillItem(
    name: 'Git',
    category: 'Version Control',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg',
  ),
  SkillItem(
    name: 'Cloudflare',
    category: 'Deploy',
    iconUrl: 'https://cdn.simpleicons.org/cloudflare/F38020',
  ),
  SkillItem(
    name: 'Firebase',
    category: 'Backend',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg',
  ),
  SkillItem(
    name: 'React',
    category: 'Frontend',
    iconUrl:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg',
  ),
];
