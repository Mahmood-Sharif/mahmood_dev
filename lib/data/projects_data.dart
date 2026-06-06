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
    outcome:
        'Built a realistic validation path for testing demand before investing in a full merchant dashboard or payment-heavy system.',
    liveUrl: 'https://jareb.app',
    technicalDetails: [
      'Structured the product around users, merchants, drops, claims, and reward validation',
      'Planned backend data flow using Supabase for early validation',
      'Designed the MVP around manual verification before full automation',
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
    outcome:
        'Learned how to translate messy business operations into product flows, technical requirements, and automation opportunities.',
    liveUrl: 'https://github.com/Mahmood-Sharif/Academity_App',
    technicalDetails: [
      'Mapped academy subscription workflows from customer registration to payment reminders',
      'Explored Tap Payments integration for recurring payment collection',
      'Planned WhatsApp automation flows for customer communication',
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
    outcome:
        'Built stronger understanding of full-stack app behavior, real-time features, privacy rules, and frontend/backend state synchronization.',
    githubUrl: 'https://github.com/YOUR_USERNAME/social-network',
    technicalDetails: [
      'Implemented authentication, profile visibility, and follow/request logic',
      'Worked with REST routes, SQLite migrations, and backend validation',
      'Debugged WebSocket messaging and notification behavior between users',
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
    outcome:
        'Improved my ability to debug live app behavior and understand how real-time communication changes user experience.',
    githubUrl: 'https://github.com/YOUR_USERNAME/real-time-forum',
    technicalDetails: [
      'Built private messaging using WebSockets',
      'Handled posts, comments, sessions, notifications, and typing indicators',
      'Connected backend events to frontend state updates',
    ],
  ),
];
