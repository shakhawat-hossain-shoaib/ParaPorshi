// lib/core/widgets/avatar.dart
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String? imageUrl;
  final String? initials;

  const Avatar({
    super.key,
    this.size = 32,
    this.imageUrl,
    this.initials,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(imageUrl!),
      );
    }
    return CircleAvatar(
      radius: size / 2,
      child: Text(
        (initials ?? '?').toUpperCase(),
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
