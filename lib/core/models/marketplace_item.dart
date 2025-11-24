// lib/core/models/marketplace_item.dart

class MarketplaceItem {
  final String id;
  final String title;
  final String priceText;
  final String? imageUrl;
  final String distanceText;
  final String description;

  MarketplaceItem({
    required this.id,
    required this.title,
    required this.priceText,
    required this.distanceText,
    required this.description,
    this.imageUrl,
  });
}
