// lib/features/home/presentation/widgets/home_top_bar.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';

class HomeTopBar extends StatelessWidget {
  final String areaName;
  final VoidCallback? onChangeAreaTap;

  const HomeTopBar({
    super.key,
    required this.areaName,
    this.onChangeAreaTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.place_outlined, size: 20),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            areaName,
            style: AppTypography.body1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: onChangeAreaTap,
          child: const Text('Change'),
        ),
      ],
    );
  }
}
