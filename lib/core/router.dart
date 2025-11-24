// lib/core/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Onboarding & Home
import 'package:hyperlocal_hub_bd/features/onboarding/presentation/screens/onboarding_welcome_screen.dart';
import 'package:hyperlocal_hub_bd/features/home/presentation/screens/home_screen.dart';

// Auth
import 'package:hyperlocal_hub_bd/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:hyperlocal_hub_bd/features/auth/presentation/screens/sign_up_screen.dart';

// Alerts
import 'package:hyperlocal_hub_bd/features/alerts/presentation/screens/alerts_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/alerts/presentation/screens/create_alert_screen.dart';

// Marketplace
import 'package:hyperlocal_hub_bd/features/marketplace/presentation/screens/marketplace_screen.dart';
import 'package:hyperlocal_hub_bd/features/marketplace/presentation/screens/marketplace_create_item_screen.dart';
import 'package:hyperlocal_hub_bd/features/marketplace/presentation/screens/marketplace_item_detail_screen.dart';
import 'package:hyperlocal_hub_bd/core/models/marketplace_item.dart';

// Services directory
import 'package:hyperlocal_hub_bd/features/services_directory/presentation/screens/services_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/services_directory/presentation/screens/service_provider_detail_screen.dart';

// Events
import 'package:hyperlocal_hub_bd/features/events/presentation/screens/events_list_screen.dart';

// Polls
import 'package:hyperlocal_hub_bd/features/polls/presentation/screens/polls_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/polls/presentation/screens/create_poll_screen.dart';

// Map
import 'package:hyperlocal_hub_bd/features/map/presentation/screens/neighborhood_map_screen.dart';

// Profile
import 'package:hyperlocal_hub_bd/features/profile/presentation/screens/profile_screen.dart';
import 'package:hyperlocal_hub_bd/features/profile/presentation/screens/edit_profile_screen.dart';

// Settings
import 'package:hyperlocal_hub_bd/features/settings/presentation/screens/settings_screen.dart';
import 'package:hyperlocal_hub_bd/features/settings/presentation/screens/verification_levels_screen.dart';

// General create post
import 'package:hyperlocal_hub_bd/features/create_post/presentation/screens/create_post_screen.dart';

// My Home
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/home_details_screen.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/bills_screen.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/residents_screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      // Onboarding
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingWelcomeScreen(),
      ),

      // Auth
      GoRoute(
        path: '/auth/sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/auth/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),

      // Main home shell
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),

      // Alerts
      GoRoute(
        path: '/alerts',
        builder: (context, state) => const AlertsListScreen(),
      ),
      GoRoute(
        path: '/alerts/create',
        builder: (context, state) => const CreateAlertScreen(),
      ),

      // Marketplace
      GoRoute(
        path: '/marketplace',
        builder: (context, state) => const MarketplaceScreen(),
      ),
      GoRoute(
        path: '/marketplace/create',
        builder: (context, state) => const MarketplaceCreateItemScreen(),
      ),
      GoRoute(
        path: '/marketplace/item',
        builder: (context, state) {
          final extra = state.extra;
          final item = extra is MarketplaceItem ? extra : null;
          return MarketplaceItemDetailScreen(item: item);
        },
      ),

      // Services directory
      GoRoute(
        path: '/services',
        builder: (context, state) => const ServicesListScreen(),
      ),
      GoRoute(
        path: '/services/provider',
        builder: (context, state) => const ServiceProviderDetailScreen(),
      ),

      // Events
      GoRoute(
        path: '/events',
        builder: (context, state) => const EventsListScreen(),
      ),

      // Polls
      GoRoute(
        path: '/polls',
        builder: (context, state) => const PollsListScreen(),
      ),
      GoRoute(
        path: '/polls/create',
        builder: (context, state) => const CreatePollScreen(),
      ),

      // Map
      GoRoute(
        path: '/map',
        builder: (context, state) => const NeighborhoodMapScreen(),
      ),

      // Profile
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/profile/edit',
        builder: (context, state) => const EditProfileScreen(),
      ),

      // Settings
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/settings/verification',
        builder: (context, state) => const VerificationLevelsScreen(),
      ),

      // General create post
      GoRoute(
        path: '/create-post',
        builder: (context, state) => const CreatePostScreen(),
      ),

      // My Home
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
    ],
  );
}
