// lib/core/models/service_provider.dart

class ServiceProviderModel {
  final String id;
  final String name;
  final String category;
  final double rating;
  final int totalReviews;
  final String distanceText;
  final String wardName;
  final String? description;
  final String? phone;

  ServiceProviderModel({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.totalReviews,
    required this.distanceText,
    required this.wardName,
    this.description,
    this.phone,
  });
}
