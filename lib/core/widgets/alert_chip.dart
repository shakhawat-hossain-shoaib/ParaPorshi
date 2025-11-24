// lib/core/widgets/alert_chip.dart
import 'package:flutter/material.dart';
import '../../config/app_colors.dart';

class AlertChip extends StatelessWidget {
  final String label;
  final Color color;

  const AlertChip({
    super.key,
    required this.label,
    required this.color,
  });

  factory AlertChip.safety() =>
      const AlertChip(label: 'নিরাপত্তা', color: AppColors.alertDanger);

  factory AlertChip.utility() =>
      const AlertChip(label: 'গ্যাস/পানি/বিদ্যুৎ', color: AppColors.alertWarning);

  factory AlertChip.lostFound() =>
      const AlertChip(label: 'হারানো/পাওয়া', color: AppColors.info);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }
}
