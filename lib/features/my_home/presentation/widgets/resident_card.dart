// lib/features/my_home/presentation/widgets/resident_card.dart

import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import '../../models/resident.dart';

class ResidentCard extends StatelessWidget {
  final Resident resident;

  const ResidentCard({
    super.key,
    required this.resident,
  });

  @override
  Widget build(BuildContext context) {
    final initials = resident.name
        .split(' ')
        .where((p) => p.isNotEmpty)
        .map((p) => p[0])
        .take(2)
        .join()
        .toUpperCase();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            initials,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        title: Text(resident.name, style: AppTypography.body1),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${resident.role} • ${resident.flatNumber}',
              style: AppTypography.body2,
            ),
            if (resident.phone != null) ...[
              const SizedBox(height: 2),
              Text(
                resident.phone!,
                style: AppTypography.body2,
              ),
            ],
          ],
        ),
        trailing: resident.isPrimary
            ? const Icon(Icons.verified, size: 20, color: Colors.green)
            : null,
      ),
    );
  }
}
