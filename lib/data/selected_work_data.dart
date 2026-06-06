import '../models/selected_work.dart';

const selectedWorks = [
  SelectedWork(
    number: '01',
    title: 'Jareb',
    category: 'F&B · Rewards · Validation',
    description:
        'Reward-based café discovery platform built to test verified visits and merchant acquisition.',
    role: 'Product direction · validation flow · customer journey',
    tools: ['Flutter', 'Supabase', 'Cloudflare', 'Product Strategy'],
    visualLabel: 'DISCOVER · VISIT · CLAIM',
    ctaLabel: 'Visit live site',
    url: 'https://jareb.app',
  ),
  SelectedWork(
    number: '02',
    title: 'Academity',
    category: 'Operations · Payments · Automation',
    description:
        'Academy operations concept for recurring payments, reminders, and customer communication.',
    role: 'Workflow mapping · payment logic · automation planning',
    tools: ['Flutter', 'APIs', 'Payments', 'WhatsApp Automation'],
    visualLabel: 'REGISTER · REMIND · COLLECT',
    ctaLabel: 'View case study',
  ),
  SelectedWork(
    number: '03',
    title: 'Social Network',
    category: 'Full-stack · Real-time · Reboot01',
    description:
        'Full-stack social platform with auth, profiles, posts, privacy, notifications, and messaging.',
    role: 'Backend logic · database structure · real-time communication',
    tools: ['Go', 'SQLite', 'WebSockets', 'React'],
    visualLabel: 'AUTH · POSTS · REAL-TIME',
    ctaLabel: 'View details',
  ),
];
