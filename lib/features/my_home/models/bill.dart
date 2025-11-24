// lib/features/my_home/models/bill.dart

enum BillType {
  water,
  electricity,
  gas,
  serviceCharge,
}

enum BillStatus {
  paid,
  unpaid,
  overdue,
}

class Bill {
  final String id;
  final BillType type;
  final String monthLabel; // e.g. "January 2025"
  final double amount;
  final DateTime dueDate;
  final BillStatus status;

  Bill({
    required this.id,
    required this.type,
    required this.monthLabel,
    required this.amount,
    required this.dueDate,
    required this.status,
  });
}
