// lib/core/models/post.dart

class PostComment {
  final String id;
  final String authorName;
  final String text;
  final DateTime createdAt;

  PostComment({
    required this.id,
    required this.authorName,
    required this.text,
    required this.createdAt,
  });
}

class Post {
  final String id;
  final String type; // 'alert', 'marketplace', 'service', 'general'
  final String title;
  final String content;
  final String authorName;
  final DateTime createdAt;
  final int upvotes;
  final int commentsCount;
  final List<PostComment> comments;

  Post({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.authorName,
    required this.createdAt,
    required this.upvotes,
    required this.commentsCount,
    required this.comments,
  });
}
