// lib/core/models/alert.dart

enum AlertCategory { safety, utility, lostFound, other }

class Alert {
  final String id;
  final AlertCategory category;
  final String title;
  final String description;
  final DateTime createdAt;
  final String locationText;

  Alert({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.locationText,
  });
}
