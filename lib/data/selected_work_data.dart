import '../models/selected_work.dart';

const selectedWorks = [
  SelectedWork(
    number: '01',
    title: 'Jareb',
    category: 'F&B rewards - validation - Bahrain/GCC',
    description:
        'A cafe and restaurant discovery product that gives users a reason to visit, verify, and come back.',
    outcome:
        'Defined the reward loop, visit flow, merchant promise, and product direction for an early GCC market test.',
    role: 'Product strategy, Flutter direction, validation, user journeys',
    tools: ['Flutter', 'Supabase', 'Cloudflare', 'Product Strategy'],
    visualLabel: 'DISCOVER - VISIT - CLAIM',
    ctaLabel: 'Visit live site',
    url: 'https://jareb.app',
    imagePath: 'assets/images/work/jareb.png',
  ),
  SelectedWork(
    number: '02',
    title: 'Academity',
    category: 'Academy operations - payments - reminders',
    description:
        'An academy management platform built around recurring payments, student records, reminders, and communication.',
    outcome:
        'Turned fragmented admin work into one operational system for subscriptions, collections, student data, and announcements.',
    role: 'Founder, Flutter developer, workflows, payments, reminders',
    tools: ['Flutter', 'APIs', 'Payments', 'WhatsApp'],
    visualLabel: 'REGISTER - REMIND - COLLECT',
    ctaLabel: 'View case study',
    imagePath: 'assets/images/work/academity.png',
  ),
  SelectedWork(
    number: '03',
    title: 'Social Network',
    category: 'Full-stack - real-time - Reboot01',
    description:
        'A full-stack social platform with authentication, posts, profiles, groups, privacy, notifications, and messaging.',
    outcome:
        'Implemented end-to-end product behavior across backend logic, database design, realtime communication, and UI states.',
    role: 'Backend logic, database design, WebSockets, product behavior',
    tools: ['Go', 'SQLite', 'WebSockets', 'React'],
    visualLabel: 'AUTH - POSTS - REAL-TIME',
    ctaLabel: 'View details',
    imagePath: 'assets/images/work/social_network.png',
  ),
];
