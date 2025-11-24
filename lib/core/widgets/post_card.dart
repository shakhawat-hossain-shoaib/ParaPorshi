// lib/core/widgets/post_card.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/core/models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _liked = false;
  late int _upvotes;

  @override
  void initState() {
    super.initState();
    _upvotes = widget.post.upvotes;
  }

  void _toggleLike() {
    setState(() {
      _liked = !_liked;
      _upvotes += _liked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    IconData leadingIcon;
    Color chipColor;

    switch (post.type) {
      case 'alert':
        leadingIcon = Icons.warning_amber_rounded;
        chipColor = AppColors.alertWarning;
        break;
      case 'marketplace':
        leadingIcon = Icons.shopping_bag_outlined;
        chipColor = AppColors.secondary;
        break;
      case 'service':
        leadingIcon = Icons.home_repair_service_outlined;
        chipColor = AppColors.info;
        break;
      default:
        leadingIcon = Icons.chat_bubble_outline;
        chipColor = AppColors.info;
        break;
    }

    final commentsToShow =
    post.comments.length > 3 ? post.comments.take(3).toList() : post.comments;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: icon + type chip + menu
            Row(
              children: [
                Icon(leadingIcon, size: 20),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: chipColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    post.type.toUpperCase(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.more_vert, size: 18),
              ],
            ),
            const SizedBox(height: 8),

            // Title
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            // Content
            if (post.content.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                post.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            const SizedBox(height: 8),

            // Reactions row
            Row(
              children: [
                InkWell(
                  onTap: _toggleLike,
                  borderRadius: BorderRadius.circular(24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          _liked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                          size: 18,
                          color: _liked ? AppColors.primary : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(_upvotes.toString()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.chat_bubble_outline, size: 16),
                const SizedBox(width: 4),
                Text(post.commentsCount.toString()),
                const Spacer(),
                Text(
                  _timeAgo(post.createdAt),
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),

            // Comments section
            if (commentsToShow.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Divider(height: 1),
              const SizedBox(height: 6),
              const Text(
                'মন্তব্য',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              ...commentsToShow.map(
                    (c) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${c.authorName}: ',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        TextSpan(
                          text: c.text,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (post.commentsCount > commentsToShow.length)
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    'আরও মন্তব্য দেখুন...',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  String _timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'এখনই';
    if (diff.inMinutes < 60) return '${diff.inMinutes} মিনিট আগে';
    if (diff.inHours < 24) return '${diff.inHours} ঘন্টা আগে';
    return '${diff.inDays} দিন আগে';
  }
}
