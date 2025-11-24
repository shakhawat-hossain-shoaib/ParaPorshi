// lib/features/my_home/presentation/widgets/my_home_header.dart

import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import '../../models/home_info.dart';

class MyHomeHeader extends StatelessWidget {
  final HomeInfo homeInfo;
  final VoidCallback? onDetailsTap;
  final VoidCallback? onBillsTap;
  final VoidCallback? onResidentsTap;

  const MyHomeHeader({
    super.key,
    required this.homeInfo,
    this.onDetailsTap,
    this.onBillsTap,
    this.onResidentsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row
            Row(
              children: [
                const Icon(Icons.house_outlined, size: 24),
                const SizedBox(width: 8),
                const Text('My Home', style: AppTypography.h2),
                const Spacer(),
                if (onDetailsTap != null)
                  TextButton(
                    onPressed: onDetailsTap,
                    child: const Text('Details'),
                  ),
              ],
            ),
            const SizedBox(height: 8),

            Text(
              '${homeInfo.flatNumber}, ${homeInfo.buildingName}',
              style: AppTypography.body1,
            ),
            const SizedBox(height: 4),
            Text(
              homeInfo.addressLine,
              style: AppTypography.body2,
            ),
            const SizedBox(height: 4),
            Text(
              homeInfo.wardName,
              style: AppTypography.body2,
            ),

            const SizedBox(height: 8),
            Row(
              children: [
                _buildChip(
                  icon: Icons.person_outline,
                  label:
                  '${homeInfo.residentsCount} ${homeInfo.residentsCount > 1 ? "people" : "person"}',
                ),
                const SizedBox(width: 8),
                _buildChip(
                  icon: Icons.verified_user_outlined,
                  label: homeInfo.ownershipType,
                ),
              ],
            ),

            if (onBillsTap != null || onResidentsTap != null) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  if (onBillsTap != null)
                    OutlinedButton.icon(
                      onPressed: onBillsTap,
                      icon: const Icon(Icons.receipt_long_outlined, size: 18),
                      label: const Text('Bills'),
                    ),
                  if (onBillsTap != null && onResidentsTap != null)
                    const SizedBox(width: 8),
                  if (onResidentsTap != null)
                    OutlinedButton.icon(
                      onPressed: onResidentsTap,
                      icon: const Icon(Icons.group_outlined, size: 18),
                      label: const Text('Residents'),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTypography.body2,
          ),
        ],
      ),
    );
  }
}
