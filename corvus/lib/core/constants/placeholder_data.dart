import 'package:corvus/core/models/note.dart';
import 'package:corvus/core/models/message.dart';
import 'package:corvus/core/models/reminder.dart';
import 'package:corvus/core/models/memory.dart';
import 'package:corvus/core/models/user.dart';
import 'package:corvus/core/models/notification.dart';

class PlaceholderData {
  PlaceholderData._();

  static final user = AppUser(
    id: '1',
    name: 'Alex Chen',
    email: 'alex@corvus.app',
    joinedAt: DateTime(2025, 9, 15),
    noteCount: 47,
    memoryCount: 128,
    streak: 12,
  );

  static final notes = [
    Note(
      id: 'n1',
      title: 'Project Alpha Architecture',
      content:
          'The microservices approach with event sourcing provides better scalability for our use case. Key components include the API gateway, service mesh, and distributed tracing...',
      createdAt: DateTime(2026, 6, 27, 14, 30),
      updatedAt: DateTime(2026, 6, 27, 14, 30),
      tags: ['work', 'architecture'],
      isPinned: true,
    ),
    Note(
      id: 'n2',
      title: 'Grocery List',
      content: '- Avocados\n- Sourdough bread\n- Olive oil\n- Cherry tomatoes\n- Fresh basil\n- Parmesan',
      createdAt: DateTime(2026, 6, 27, 9, 0),
      updatedAt: DateTime(2026, 6, 27, 9, 0),
      tags: ['personal'],
      isPinned: false,
    ),
    Note(
      id: 'n3',
      title: 'Book Notes: Atomic Habits',
      content:
          'The four laws of behavior change: 1. Make it obvious, 2. Make it attractive, 3. Make it easy, 4. Make it satisfying. Habit stacking is key...',
      createdAt: DateTime(2026, 6, 25, 20, 15),
      updatedAt: DateTime(2026, 6, 26, 10, 0),
      tags: ['reading', 'self-improvement'],
      isPinned: false,
    ),
    Note(
      id: 'n4',
      title: 'Meeting Notes - Sprint Planning',
      content:
          'Sprint 24 goals: Complete payment integration, fix navigation bug, implement search. Velocity: 32 points. Team capacity: 4 devs, 1 QA.',
      createdAt: DateTime(2026, 6, 24, 11, 0),
      updatedAt: DateTime(2026, 6, 24, 11, 0),
      tags: ['work', 'meeting'],
      isPinned: false,
    ),
    Note(
      id: 'n5',
      title: 'Weekend Trip Ideas',
      content: 'Consider: Big Sur coast drive, Yosemite Valley, or Lake Tahoe. Need to check cabin availability and weather conditions.',
      createdAt: DateTime(2026, 6, 22, 16, 45),
      updatedAt: DateTime(2026, 6, 23, 8, 30),
      tags: ['personal', 'travel'],
      isPinned: false,
    ),
  ];

  static final messages = [
    Message(
      id: 'm1',
      content: 'Hey Corvus, can you remember what I was working on last week?',
      sender: MessageSender.user,
      timestamp: DateTime(2026, 6, 28, 10, 15),
    ),
    Message(
      id: 'm2',
      content:
          'Sure! Last week you were focused on the Project Alpha architecture. You drafted a microservices plan with event sourcing and were researching API gateway options. Want me to pull up those notes?',
      sender: MessageSender.ai,
      timestamp: DateTime(2026, 6, 28, 10, 15, 2),
    ),
    Message(
      id: 'm3',
      content: 'Yes, please. Also remind me about any deadlines this week.',
      sender: MessageSender.user,
      timestamp: DateTime(2026, 6, 28, 10, 16),
    ),
    Message(
      id: 'm4',
      content:
          'Here\'s what I found:\n\n**Project Alpha Notes**\n- Microservices architecture with event sourcing\n- Key components: API gateway, service mesh, distributed tracing\n\n**This Week\'s Deadlines**\n- 📅 Sprint review: Wednesday 3 PM\n- 📅 Design doc draft: Friday EOD\n- 📅 Dentist appointment: Thursday 10 AM\n\nI\'ve also set a reminder for each of these. Anything else?',
      sender: MessageSender.ai,
      timestamp: DateTime(2026, 6, 28, 10, 16, 5),
    ),
    Message(
      id: 'm5',
      content: 'That\'s perfect. Thanks Corvus!',
      sender: MessageSender.user,
      timestamp: DateTime(2026, 6, 28, 10, 17),
    ),
    Message(
      id: 'm6',
      content: 'You\'re welcome! I\'m here to help you stay organized. 😊',
      sender: MessageSender.ai,
      timestamp: DateTime(2026, 6, 28, 10, 17, 3),
    ),
  ];

  static final reminders = [
    Reminder(
      id: 'r1',
      title: 'Sprint Review Meeting',
      description: 'Room 4B, bring demo environment',
      dueDate: DateTime(2026, 6, 29, 15, 0),
      priority: ReminderPriority.high,
      category: 'work',
    ),
    Reminder(
      id: 'r2',
      title: 'Design Doc Draft Due',
      description: 'Share with team for review',
      dueDate: DateTime(2026, 7, 1, 17, 0),
      priority: ReminderPriority.medium,
      category: 'work',
    ),
    Reminder(
      id: 'r3',
      title: 'Dentist Appointment',
      description: 'Dr. Smith, 123 Main St',
      dueDate: DateTime(2026, 6, 30, 10, 0),
      priority: ReminderPriority.high,
      category: 'personal',
    ),
    Reminder(
      id: 'r4',
      title: 'Buy birthday gift',
      dueDate: DateTime(2026, 7, 3, 12, 0),
      priority: ReminderPriority.medium,
      category: 'personal',
    ),
    Reminder(
      id: 'r5',
      title: 'Read chapter 5 of Design Patterns',
      dueDate: DateTime(2026, 7, 5, 20, 0),
      priority: ReminderPriority.low,
      category: 'learning',
    ),
    Reminder(
      id: 'r6',
      title: 'Team standup',
      dueDate: DateTime(2026, 6, 29, 9, 30),
      priority: ReminderPriority.medium,
      category: 'work',
    ),
  ];

  static final memories = [
    Memory(
      id: 'mem1',
      title: 'Preferred coding setup',
      snippet: 'Alex prefers VS Code with JetBrains Mono font, uses the "Night Owl" theme, and has a custom keybinding for git commands.',
      category: 'preferences',
      timestamp: DateTime(2026, 6, 20),
      tags: ['work', 'setup'],
    ),
    Memory(
      id: 'mem2',
      title: 'Coffee order',
      snippet: 'Orders a flat white with oat milk from the café on 3rd Street. Usually goes around 9 AM before heading to the office.',
      category: 'personal',
      timestamp: DateTime(2026, 6, 18),
      tags: ['personal', 'routine'],
    ),
    Memory(
      id: 'mem3',
      title: 'Favorite productivity method',
      snippet: 'Uses the Pomodoro Technique with 45-minute focus sessions and 15-minute breaks. Prefers deep work in the morning.',
      category: 'work-habits',
      timestamp: DateTime(2026, 6, 15),
      tags: ['productivity', 'routine'],
    ),
    Memory(
      id: 'mem4',
      title: 'Vegetarian recipes mentioned',
      snippet: 'Likes mushroom risotto, Thai green curry, and shakshuka. Avoiding dairy but open to experiment with vegan alternatives.',
      category: 'food',
      timestamp: DateTime(2026, 6, 12),
      tags: ['food', 'preferences'],
    ),
    Memory(
      id: 'mem5',
      title: 'Running goal',
      snippet: 'Training for a half-marathon in October. Current pace: 5:30/km. Long runs on Saturday mornings at the river trail.',
      category: 'fitness',
      timestamp: DateTime(2026, 6, 10),
      tags: ['fitness', 'goals'],
    ),
    Memory(
      id: 'mem6',
      title: 'Podcast recommendations',
      snippet: 'Enjoys "Lex Fridman Podcast", "Hardcore History", and "The Tim Ferriss Show". Recently finished a series on ancient Rome.',
      category: 'entertainment',
      timestamp: DateTime(2026, 6, 5),
      tags: ['media', 'recommendations'],
    ),
  ];

  static final notifications = [
    AppNotification(
      id: 'notif1',
      title: 'Sprint Review in 1 hour',
      body: 'Don\'t forget to prepare the demo environment before the meeting.',
      type: NotificationType.reminder,
      timestamp: DateTime(2026, 6, 29, 14, 0),
      isRead: false,
      actionRoute: '/reminders',
    ),
    AppNotification(
      id: 'notif2',
      title: 'New memory saved',
      body: 'Corvus remembered your preferred coding setup.',
      type: NotificationType.memory,
      timestamp: DateTime(2026, 6, 28, 11, 30),
      isRead: false,
      actionRoute: '/memory',
    ),
    AppNotification(
      id: 'notif3',
      title: 'Alex, you mentioned...',
      body: 'You wanted to revisit the microservices architecture discussion. I found related notes.',
      type: NotificationType.suggestion,
      timestamp: DateTime(2026, 6, 28, 8, 0),
      isRead: true,
      actionRoute: '/notes',
    ),
    AppNotification(
      id: 'notif4',
      title: 'Team standup tomorrow',
      body: 'Reminder: Standup at 9:30 AM in the usual meeting room.',
      type: NotificationType.reminder,
      timestamp: DateTime(2026, 6, 28, 7, 0),
      isRead: true,
      actionRoute: '/reminders',
    ),
    AppNotification(
      id: 'notif5',
      title: 'Weekly summary ready',
      body: 'You captured 12 notes, set 5 reminders, and asked 48 questions this week.',
      type: NotificationType.system,
      timestamp: DateTime(2026, 6, 27, 22, 0),
      isRead: true,
    ),
  ];

  static final suggestedPrompts = [
    'Remember my coffee order',
    'What did I do yesterday?',
    'Set a reminder for tomorrow',
    'Summarize my notes',
    'Plan my week',
  ];

  static const onboardingSlides = [
    _OnboardingSlideData(
      title: 'Capture Naturally',
      description: 'Chat with Corvus like you would with a friend. No rigid forms, no complicated menus — just conversation.',
      icon: 'message',
    ),
    _OnboardingSlideData(
      title: 'Never Forget Again',
      description: 'Corvus remembers what matters. Names, dates, preferences, ideas — ask anytime and get instant recall.',
      icon: 'brain',
    ),
    _OnboardingSlideData(
      title: 'Your AI Memory',
      description: 'Organize knowledge effortlessly. Schedule tasks, set reminders, and let AI connect the dots for you.',
      icon: 'sparkles',
    ),
  ];
}

class _OnboardingSlideData {
  final String title;
  final String description;
  final String icon;

  const _OnboardingSlideData({
    required this.title,
    required this.description,
    required this.icon,
  });
}
