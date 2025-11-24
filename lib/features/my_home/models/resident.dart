// lib/features/my_home/models/resident.dart

class Resident {
  final String id;
  final String name;
  final String role; // e.g. "Owner", "Tenant"
  final String? phone;
  final bool isPrimary;

  Resident({
    required this.id,
    required this.name,
    required this.role,
    this.phone,
    this.isPrimary = false,
  });
}
