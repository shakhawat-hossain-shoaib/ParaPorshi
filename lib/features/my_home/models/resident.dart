// lib/features/my_home/models/resident.dart

class Resident {
  final String id;
  final String name;
  final String role; // e.g. "Owner", "Tenant"
  final String? phone;
  final String flatNumber;
  final bool isPrimary;

  Resident({
    required this.id,
    required this.name,
    required this.role,
    required this.flatNumber,
    this.phone,
    this.isPrimary = false,
  });
}
