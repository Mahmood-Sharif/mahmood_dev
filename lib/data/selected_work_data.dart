import '../models/selected_work.dart';

const selectedWorks = [
  SelectedWork(
    number: '01',
    title: 'Jareb',
    category: 'F&B · Rewards · Validation',
    description: 'A café discovery platform that rewards verified visits.',
    role: 'Product direction · validation · user flow',
    tools: ['Flutter', 'Supabase', 'Cloudflare', 'Product Strategy'],
    visualLabel: 'DISCOVER · VISIT · CLAIM',
    ctaLabel: 'Visit live site',
    url: 'https://jareb.app',
  ),
  SelectedWork(
    number: '02',
    title: 'Academity',
    category: 'Operations · Payments · Automation',
    description: 'A payment and reminder system for academies.',
    role: 'Workflows · payments · reminders',
    tools: ['Flutter', 'APIs', 'Payments', 'WhatsApp'],
    visualLabel: 'REGISTER · REMIND · COLLECT',
    ctaLabel: 'View case study',
  ),
  SelectedWork(
    number: '03',
    title: 'Social Network',
    category: 'Full-stack · Real-time · Reboot01',
    description:
        'A full-stack social app with profiles, posts, privacy, and real-time messaging.',
    role: 'Backend logic · database · WebSockets',
    tools: ['Go', 'SQLite', 'WebSockets', 'React'],
    visualLabel: 'AUTH · POSTS · REAL-TIME',
    ctaLabel: 'View details',
  ),
];
