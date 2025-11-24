// lib/core/widgets/pill_tag.dart
import 'package:flutter/material.dart';

class PillTag extends StatelessWidget {
  final String label;
  final IconData? icon;

  const PillTag({
    super.key,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14),
            const SizedBox(width: 4),
          ],
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
