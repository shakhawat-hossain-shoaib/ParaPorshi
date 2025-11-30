// lib/core/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Onboarding & Auth (standalone)
import 'package:hyperlocal_hub_bd/features/onboarding/presentation/screens/onboarding_welcome_screen.dart';
import 'package:hyperlocal_hub_bd/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:hyperlocal_hub_bd/features/auth/presentation/screens/sign_up_screen.dart';

// App features (children of shell)
import 'package:hyperlocal_hub_bd/features/home/presentation/screens/home_screen.dart';
import 'package:hyperlocal_hub_bd/features/alerts/presentation/screens/alerts_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/marketplace/presentation/screens/marketplace_screen.dart';
import 'package:hyperlocal_hub_bd/features/services_directory/presentation/screens/services_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/my_home_screen.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/home_details_screen.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/bills_screen.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/residents_screen.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/notice_board_screen.dart';

// Other screens (events, polls, profile etc.)
import 'package:hyperlocal_hub_bd/features/events/presentation/screens/events_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/polls/presentation/screens/polls_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/map/presentation/screens/neighborhood_map_screen.dart';
import 'package:hyperlocal_hub_bd/features/profile/presentation/screens/profile_screen.dart';
import 'package:hyperlocal_hub_bd/features/settings/presentation/screens/settings_screen.dart';

import 'package:hyperlocal_hub_bd/config/app_colors.dart';

/// Build a GoRouter with an app shell that shows persistent bottom nav.
GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      // standalone routes
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingWelcomeScreen(),
      ),
      GoRoute(
        path: '/auth/sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/auth/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),

      // ShellRoute: persistent bottom navigation and shared scaffold
      ShellRoute(
        // Use the builder `state` inside ShellRoute builder to obtain location.
        builder: (context, state, child) {
          // `state.subloc` is a stable, short location path (e.g., '/home') supported by GoRouter.
          // The shell can derive the active tab index from the child widget type.
          return AppShell(child: child);
        },
        routes: [
          // top-level app tabs (rendered inside shell)
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/alerts',
            builder: (context, state) => const AlertsListScreen(),
          ),
          GoRoute(
            path: '/marketplace',
            builder: (context, state) => const MarketplaceScreen(),
          ),
          GoRoute(
            path: '/services',
            builder: (context, state) => const ServicesListScreen(),
          ),
          // My Home and its subpages (all inside shell)
          GoRoute(
            path: '/my-home',
            builder: (context, state) => const MyHomeScreen(),
          ),
          GoRoute(
            path: '/my-home/details',
            builder: (context, state) => const HomeDetailsScreen(),
          ),
          GoRoute(
            path: '/my-home/bills',
            builder: (context, state) => const BillsScreen(),
          ),
          GoRoute(
            path: '/my-home/residents',
            builder: (context, state) => const ResidentsScreen(),
          ),
          GoRoute(
            path: '/my-home/notice-board',
            builder: (context, state) => const NoticeBoardScreen(),
          ),

          // other app routes you want inside the shell
          GoRoute(
            path: '/events',
            builder: (context, state) => const EventsListScreen(),
          ),
          GoRoute(
            path: '/polls',
            builder: (context, state) => const PollsListScreen(),
          ),
          GoRoute(
            path: '/map',
            builder: (context, state) => const NeighborhoodMapScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}

/// Simple App Shell widget that renders the child and bottom navigation.
/// Customize styles/colors/icons to match your app theme.
class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  int _indexForChild(Widget child) {
    if (child is HomeScreen) return 0;
    if (child is AlertsListScreen) return 1;
    if (child is MarketplaceScreen) return 2;
    if (child is ServicesListScreen) return 3;
    if (child is MyHomeScreen) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _indexForChild(child);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey[700],
        onTap: (i) {
          switch (i) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/alerts');
              break;
            case 2:
              context.go('/marketplace');
              break;
            case 3:
              context.go('/services');
              break;
            case 4:
            default:
              context.go('/my-home');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'হোম'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'সতর্কতা'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: 'কেনাকাটা'),
          BottomNavigationBarItem(icon: Icon(Icons.home_repair_service_outlined), label: 'সেবা'),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'নিজ বাড়ি'),
        ],
      ),
    );
  }
}
