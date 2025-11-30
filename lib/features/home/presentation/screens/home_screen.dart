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
  late List<Post> _posts;

  @override
  void initState() {
    super.initState();
    _posts = PostLocalData.posts;
  }


  Widget _buildHomeFeed() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 80),
      children: [
        const SizedBox(height: 8),
        ..._posts.map((p) => PostCard(post: p)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ParaPorshi '),
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
      body: SafeArea(child: _buildHomeFeed()),
    );
  }
}
