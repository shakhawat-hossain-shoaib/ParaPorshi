// lib/features/home/presentation/widgets/home_feed_list.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/core/models/post.dart';
import 'package:hyperlocal_hub_bd/core/widgets/post_card.dart';

class HomeFeedList extends StatelessWidget {
  final List<Post> posts;

  const HomeFeedList({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return const Center(
        child: Text('এখনও কোনো পোস্ট নেই।'),
      );
    }

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostCard(post: posts[index]),
    );
  }
}
