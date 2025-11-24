// lib/features/my_home/presentation/widgets/bill_card.dart

import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import '../../models/bill.dart';

class BillCard extends StatelessWidget {
  final Bill bill;

  const BillCard({
    super.key,
    required this.bill,
  });

  String _typeLabel(BillType type) {
    switch (type) {
      case BillType.water:
        return 'Water';
      case BillType.electricity:
        return 'Electricity';
      case BillType.gas:
        return 'Gas';
      case BillType.serviceCharge:
        return 'Service charge';
    }
  }

  Color _statusColor(BillStatus status) {
    switch (status) {
      case BillStatus.paid:
        return AppColors.success;
      case BillStatus.unpaid:
        return AppColors.info;
      case BillStatus.overdue:
        return AppColors.alertDanger;
    }
  }

  String _statusLabel(BillStatus status) {
    switch (status) {
      case BillStatus.paid:
        return 'Paid';
      case BillStatus.unpaid:
        return 'Unpaid';
      case BillStatus.overdue:
        return 'Overdue';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(bill.status);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // icon area
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.receipt_long_outlined,
                color: color,
              ),
            ),
            const SizedBox(width: 10),

            // text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_typeLabel(bill.type)} • ${bill.monthLabel}',
                    style: AppTypography.body1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Due: ${bill.dueDate.day}-${bill.dueDate.month}-${bill.dueDate.year}',
                    style: AppTypography.body2,
                  ),
                ],
              ),
            ),

            // amount + status
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '৳${bill.amount.toStringAsFixed(0)}',
                  style: AppTypography.body1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    _statusLabel(bill.status),
                    style: TextStyle(
                      fontSize: 11,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
