// lib/features/my_home/presentation/screens/my_home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/features/my_home/data/my_home_repository.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/widgets/my_home_header.dart';
import 'package:hyperlocal_hub_bd/core/widgets/back_app_bar.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentIndex = 4; // ধরে নিচ্ছি 'নিজ বাড়ি' হচ্ছে index 4

  void _onNavTap(int index) {
    // change index locally and navigate to corresponding route
    setState(() => _currentIndex = index);

    switch (index) {
      case 0:
        context.go('/home'); // Home
        break;
      case 1:
        context.go('/alerts'); // সতর্কতা
        break;
      case 2:
        context.go('/marketplace'); // কেনাকাটা
        break;
      case 3:
        context.go('/services'); // সেবা
        break;
      case 4:
      default:
        context.go('/my-home'); // নিজ বাড়ি
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // আপনি চাইলে এখানে AppBar রাখতে পারেন; MyHomeScreen এ সাধারণত উপরেরবার ছিল না
      appBar: AppBar(
        title: const Text('নিজ বাড়ি'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
        ],
      ),

      body: FutureBuilder(
        future: myHomeRepository.getHomeInfo(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final info = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              MyHomeHeader(homeInfo: info),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: _QuickActionButton(
                        icon: Icons.assignment,
                        label: 'বাড়ির বিস্তারিত',
                        onTap: () => context.go('/my-home/details'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _QuickActionButton(
                        icon: Icons.receipt_long,
                        label: 'বিলসমূহ',
                        onTap: () => context.go('/my-home/bills'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _QuickActionButton(
                        icon: Icons.people_alt,
                        label: 'বাসিন্দা',
                        onTap: () => context.go('/my-home/residents'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _QuickActionButton(
                  icon: Icons.announcement,
                  label: 'নোটিশ বোর্ড',
                  onTap: () => context.go('/my-home/notice-board'),
                ),
              ),
            ],
          );
        },
      ),

      // ===== persistent bottom navigation bar =====
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey[700],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'হোম'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'সতর্কতা'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: 'কেনাকাটা'),
          BottomNavigationBarItem(icon: Icon(Icons.room_service_outlined), label: 'সেবা'),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'নিজ বাড়ি'),
        ],
      ),
    );
  }
}

/// Safe Quick Action button using Material+Ink+InkWell
class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2)),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: AppColors.primary),
                const SizedBox(height: 6),
                Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
