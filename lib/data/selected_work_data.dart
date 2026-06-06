import '../models/selected_work.dart';

const selectedWorks = [
  SelectedWork(
    number: '01',
    title: 'Jareb',
    category: 'F&B · Rewards · Validation',
    description:
        'A reward-based discovery platform for cafés and restaurants in Bahrain.',
    role:
        'Identified the merchant acquisition problem, shaped the customer journey, and built the validation direction.',
    tools: ['Flutter', 'Supabase', 'Cloudflare', 'Product Strategy'],
    visualLabel: 'DISCOVER · VISIT · CLAIM',
  ),
  SelectedWork(
    number: '02',
    title: 'Academity',
    category: 'Operations · Payments · Automation',
    description:
        'An academy operations and subscription collection system for recurring payments.',
    role:
        'Mapped manual payment workflows, reminder logic, and automation opportunities for academies.',
    tools: ['Flutter', 'APIs', 'Payments', 'WhatsApp Automation'],
    visualLabel: 'REGISTER · REMIND · COLLECT',
  ),
  SelectedWork(
    number: '03',
    title: 'Social Network',
    category: 'Full-stack · Real-time · Reboot01',
    description:
        'A full-stack social platform with auth, profiles, posts, followers, notifications, and messaging.',
    role:
        'Built backend logic, privacy flows, database structure, and real-time communication behavior.',
    tools: ['Go', 'SQLite', 'WebSockets', 'React'],
    visualLabel: 'AUTH · POSTS · REAL-TIME',
  ),
];
