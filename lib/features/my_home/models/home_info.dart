// lib/features/my_home/models/home_info.dart

class HomeInfo {
  final String flatNumber;
  final String buildingName;
  final String addressLine;
  final String wardName;
  final String ownershipType; // "Owner", "Tenant"
  final int residentsCount;
  final String? notes;

  HomeInfo({
    required this.flatNumber,
    required this.buildingName,
    required this.addressLine,
    required this.wardName,
    required this.ownershipType,
    required this.residentsCount,
    this.notes, required String flatNo, required String road, required String area, required String city, required String ward, required String ownerName, required String contactPhone, required int familyMembers, required DateTime livingSince,
  });
}
