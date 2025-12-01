// lib/features/marketplace/presentation/screens/marketplace_item_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hyperlocal_hub_bd/core/models/marketplace_item.dart';

class MarketplaceItemDetailScreen extends StatelessWidget {
  /// Optional item; if null, we show placeholder content
  final MarketplaceItem? item;

  const MarketplaceItemDetailScreen({
    super.key,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    // Use real item if provided, otherwise fallback to sample data
    final String title = item?.title ?? 'Sample product title';
    final String priceText = item?.priceText ?? '৳ ২,৫০০';
    final String distanceText = item?.distanceText ?? '৫০০ মিটার দূরে';
    final String description = item?.description ??
        'This is a placeholder product description. Later this screen will show the real item details like condition, usage duration, seller notes, etc.';
    final String? imageUrl = item?.imageUrl;

    return Scaffold(
      appBar: AppBar(
        title: const Text('পণ্যের বিস্তারিত'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // image
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
              image: imageUrl != null
                  ? DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: imageUrl == null
                ? const Icon(Icons.image, size: 64)
                : null,
          ),
          const SizedBox(height: 16),

          // title
          Text(
            title,
            style: AppTypography.h2,
          ),
          const SizedBox(height: 8),

          // price
          Text(
            priceText,
            style: AppTypography.h1.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 8),

          // location / distance
          Row(
            children: [
              const Icon(Icons.place_outlined, size: 18),
              const SizedBox(width: 4),
              Text(
                distanceText,
                style: AppTypography.body2,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // description
          Text(
            'Description',
            style:
            AppTypography.body1.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: AppTypography.body2,
          ),
          const SizedBox(height: 24),

          // seller section – show contact and actions
          Text(
            'Seller',
            style: AppTypography.body1.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text(
              'Sample Seller',
              style: AppTypography.body1,
            ),
            subtitle: const Text(
              'Member of ParaConnect',
              style: AppTypography.body2,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              // small chat square
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary),
                ),
                child: IconButton(
                  icon: Icon(Icons.chat_bubble_outline, color: AppColors.primary),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Chat not implemented yet')));
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () async {
                    final phone = item?.sellerPhone ?? '+8801712345678';
                    final url = Uri.parse('tel:$phone');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cannot make a call')));
                    }
                  },
                  icon: const Icon(Icons.call, size: 18),
                  label: const Text('কল করুন'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
