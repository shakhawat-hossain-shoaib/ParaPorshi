// lib/core/widgets/error_view.dart
import 'package:flutter/material.dart';
import '../../config/app_typography.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('কিছু একটা ভুল হয়েছে', style: AppTypography.h2),
            const SizedBox(height: 8),
            Text(message, style: AppTypography.body2, textAlign: TextAlign.center),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('আবার চেষ্টা করুন'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
