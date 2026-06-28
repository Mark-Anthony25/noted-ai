import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/features/splash/splash_screen.dart';
import 'package:corvus/features/onboarding/onboarding_screen.dart';
import 'package:corvus/features/auth/sign_in_screen.dart';
import 'package:corvus/features/auth/sign_up_screen.dart';
import 'package:corvus/features/home/home_dashboard.dart';
import 'package:corvus/features/chat/chat_screen.dart';
import 'package:corvus/features/chat_head_preview/chat_head_preview_screen.dart';
import 'package:corvus/features/notes/notes_list_screen.dart';
import 'package:corvus/features/notes/note_detail_screen.dart';
import 'package:corvus/features/reminders/reminder_list_screen.dart';
import 'package:corvus/features/calendar/calendar_screen.dart';
import 'package:corvus/features/memory/memory_timeline_screen.dart';
import 'package:corvus/features/memory/memory_detail_screen.dart';
import 'package:corvus/features/search/search_screen.dart';
import 'package:corvus/features/notifications/notifications_screen.dart';
import 'package:corvus/features/profile/profile_screen.dart';
import 'package:corvus/features/settings/settings_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => _ShellWithBottomNav(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeDashboard(),
        ),
        GoRoute(
          path: '/notes',
          builder: (context, state) => const NotesListScreen(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return NoteDetailScreen(noteId: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/reminders',
          builder: (context, state) => const ReminderListScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: '/chat-head-preview',
      builder: (context, state) => const ChatHeadPreviewScreen(),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) => const CalendarScreen(),
    ),
    GoRoute(
      path: '/memory',
      builder: (context, state) => const MemoryTimelineScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return MemoryDetailScreen(memoryId: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

class _ShellWithBottomNav extends StatelessWidget {
  final Widget child;

  const _ShellWithBottomNav({required this.child});

  int _currentIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/notes')) return 1;
    if (location.startsWith('/reminders')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _currentIndex(location);
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: Dimensions.bottomNavHeight + bottomPadding),
        child: child,
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomNavHeight + bottomPadding,
        padding: EdgeInsets.only(bottom: bottomPadding),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          children: [
            _NavItem(
              icon: LucideIcons.home,
              label: 'Home',
              isSelected: currentIndex == 0,
              onTap: () => context.go('/home'),
            ),
            _NavItem(
              icon: LucideIcons.fileText,
              label: 'Notes',
              isSelected: currentIndex == 1,
              onTap: () => context.go('/notes'),
            ),
            _CenterChatButton(
              onTap: () => context.push('/chat'),
            ),
            _NavItem(
              icon: LucideIcons.bell,
              label: 'Reminders',
              isSelected: currentIndex == 3,
              onTap: () => context.go('/reminders'),
            ),
            _NavItem(
              icon: LucideIcons.user,
              label: 'Profile',
              isSelected: currentIndex == 4,
              onTap: () => context.go('/profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final unselected = Theme.of(context).textTheme.bodySmall?.color ?? AppColors.textTertiary;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: Dimensions.iconMd,
                color: isSelected ? primary : unselected,
              ),
              const SizedBox(height: Spacing.xxs),
              Text(
                label,
                style: (isSelected ? AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w500) : AppTextStyles.labelSmall).copyWith(
                  color: isSelected ? primary : unselected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CenterChatButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CenterChatButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        margin: const EdgeInsets.symmetric(horizontal: Spacing.xs),
        decoration: BoxDecoration(
          color: primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          LucideIcons.messageCircle,
          color: primary,
          size: 22,
        ),
      ),
    );
  }
}
