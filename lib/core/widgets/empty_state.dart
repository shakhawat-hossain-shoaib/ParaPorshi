// lib/core/widgets/empty_state.dart
import 'package:flutter/material.dart';
import '../../config/app_typography.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? action;

  const EmptyState({
    super.key,
    required this.title,
    this.message,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: AppTypography.h2, textAlign: TextAlign.center),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(message!, style: AppTypography.body2, textAlign: TextAlign.center),
            ],
            if (action != null) ...[
              const SizedBox(height: 16),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
