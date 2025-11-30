// lib/features/my_home/presentation/screens/my_home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/features/my_home/data/my_home_repository.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/widgets/my_home_header.dart';
import 'package:hyperlocal_hub_bd/core/widgets/back_app_bar.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keep a simple top app bar for this screen
      appBar: AppBar(
        title: const Text('নিজ বাড়ি'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
        ],
      ),

      // Body uses FutureBuilder to load home info
      body: FutureBuilder(
        future: myHomeRepository.getHomeInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('ত্রুটি: ${snapshot.error}'));
          }
          final info = snapshot.data;
          if (info == null) {
            return const Center(child: Text('কোনো বাড়ির তথ্য পাওয়া যায়নি।'));
          }

          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              MyHomeHeader(homeInfo: info),
              const SizedBox(height: 8),

              // quick action grid
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
    );
  }
}

/// Safe Quick Action button using Material+Ink+InkWell
/// (prevents "No Material widget found" runtime error)
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
