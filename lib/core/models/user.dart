// lib/core/models/user.dart

class User {
  final String id;
  final String name;
  final String? avatarUrl;
  final String wardName;

  User({
    required this.id,
    required this.name,
    required this.wardName,
    this.avatarUrl,
  });
}
