import '../models/project.dart';

const projects = [
  Project(
    title: 'Jareb',
    role: 'Flutter Developer / Product Builder',
    techStack: 'Flutter, Supabase, Cloudflare, Product Strategy',
    description:
        'A reward-based discovery platform for cafés and restaurants, built around verified visits, cashback drops, and merchant acquisition.',
    highlights: [
      'Designed the customer journey from discovery to claim verification',
      'Built validation website and signup flow',
      'Structured product logic around merchants, users, drops, and rewards',
    ],
  ),
  Project(
    title: 'Academity',
    role: 'Founder / Flutter Developer',
    techStack: 'Flutter, APIs, Payments, WhatsApp Automation',
    description:
        'An academy management and subscription collection platform focused on operations, payments, reminders, and customer communication.',
    highlights: [
      'Built core product concept for academies and recurring payments',
      'Worked on payment collection and reminder workflows',
      'Explored Tap Payments and WhatsApp automation integrations',
    ],
  ),
  Project(
    title: 'Social Network',
    role: 'Full-Stack Developer',
    techStack: 'Go, SQLite, WebSockets, React, REST APIs',
    description:
        'A full-stack social network project with authentication, profiles, posts, followers, privacy controls, notifications, and real-time messaging.',
    highlights: [
      'Implemented authentication and database structure',
      'Built follow/request/private profile logic',
      'Debugged real-time messaging and notification behavior',
    ],
  ),
  Project(
    title: 'Real-Time Forum',
    role: 'Backend / Full-Stack Developer',
    techStack: 'Go, JavaScript, SQLite, WebSockets',
    description:
        'A forum application with posts, comments, private messages, typing indicators, notifications, and real-time communication.',
    highlights: [
      'Implemented WebSocket-based real-time features',
      'Handled auth, posts, comments, and private messages',
      'Worked with backend routes and frontend state updates',
    ],
  ),
];
