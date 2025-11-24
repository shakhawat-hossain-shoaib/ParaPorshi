// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hyperlocal_hub_bd/core/models/post.dart';
import 'package:hyperlocal_hub_bd/core/widgets/post_card.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';

// Tabs
import 'package:hyperlocal_hub_bd/features/alerts/presentation/screens/alerts_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/marketplace/presentation/screens/marketplace_screen.dart';
import 'package:hyperlocal_hub_bd/features/services_directory/presentation/screens/services_list_screen.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/screens/my_home_screen.dart';

// Feed data
import 'package:hyperlocal_hub_bd/features/posts/data/post_local_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late List<Post> _posts;

  @override
  void initState() {
    super.initState();
    _posts = PostLocalData.posts;
  }

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _buildHomeFeed() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 80),
      children: [
        const SizedBox(height: 8),
        ..._posts.map((p) => PostCard(post: p)).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildHomeFeed(),             // index 0: Home feed
      const AlertsListScreen(),     // index 1: সতর্কতা
      const MarketplaceScreen(),    // index 2: Marketplace
      const ServicesListScreen(),   // index 3: Services
      const MyHomeScreen(),         // index 4: নিজ বাড়ি
    ];

    final titles = [
      'ParaConnect',
      'সতর্কতা',   // ⭐ আগে "অ্যালার্ট" ছিল
      'কেনাবেচা',
      'সেবা',
      'নিজ বাড়ি',
    ];


    final bool hideAppBar = _selectedIndex == 1 || _selectedIndex == 2;

    return Scaffold(
      appBar: hideAppBar
          ? null
          : AppBar(
        title: Text(titles[_selectedIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              context.push('/profile');
            },
          ),
        ],
      ),
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'হোম',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'সতর্কতা', //
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'কেনাবেচা',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service_outlined),
            label: 'সেবা',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house_rounded),
            label: 'নিজ বাড়ি',
          ),
        ],
      ),
    );
  }
}
