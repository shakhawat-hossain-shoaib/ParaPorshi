// lib/features/marketplace/presentation/screens/marketplace_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/core/models/marketplace_item.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // dummy items – using your MarketplaceItem model
    final List<MarketplaceItem> items = [
      MarketplaceItem(
        id: '1',
        title: 'স্টাডি টেবিল',
        priceText: '৳২,৫০০',
        sellerPhone: '+8801712345678',
        imageUrl: 'https://images.unsplash.com/photo-1519710164239-da123dc03ef4?auto=format&fit=crop&w=800&q=60',
        distanceText: '৫০০ মিটার দূরে',
        description: '২ বছর ব্যবহার, ভালো অবস্থা। শুধুমাত্র নিজে এসে নিয়ে যেতে হবে।',
      ),
      MarketplaceItem(
        id: '2',
        title: 'সাইকেল',
        priceText: '৳৩,০০০',
        sellerPhone: '+8801712345679',
        imageUrl: 'https://images.unsplash.com/photo-1485965120184-e220f721d03e?auto=format&fit=crop&w=800&q=60',
        distanceText: '৫০০ মিটার দূরে',
        description: 'শিশুদের সাইকেল, প্রায় নতুন।',
      ),
      MarketplaceItem(
        id: '3',
        title: 'ল্যাপটপ',
        priceText: '৳১৮,০০০',
        sellerPhone: '+8801712345680',
        imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=800&q=60',
        distanceText: '৫০০ মিটার দূরে',
        description: 'Core i5, 8GB RAM, 256GB SSD। অফিস কাজের জন্য ভালো।',
      ),
      MarketplaceItem(
        id: '4',
        title: 'খাট',
        priceText: '৳৬,৫০০',
        sellerPhone: '+8801712345681',
        imageUrl: 'https://images.unsplash.com/photo-1505693416388-b0346d6771b4?auto=format&fit=crop&w=800&q=60',
        distanceText: '৫০০ মিটার দূরে',
        description: '৬x৫ সাইজ, সেগুন কাঠের।',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header: বাজার + +বিক্রয়
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Row(
            children: [
              const Text('বাজার', style: AppTypography.h2),
              const Spacer(),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                onPressed: () {
                    debugPrint('Marketplace: create button pressed');
                    context.push('/marketplace/create');
                  },
                icon: const Icon(Icons.add, size: 18),
                label: const Text(
                  'বিক্রয়',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 4),

        // Grid of items
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                final item = items[index];

                bool isFav = false; // ephemeral per-card state
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias, // ripple nicely clipped
                  child: StatefulBuilder(
                    builder: (context, setStateCard) {
                      return InkWell(
                        onTap: () {
                      // 👉 go_router diye details screen e jao
                      context.push(
                        '/marketplace/item',
                        extra: item, // MarketplaceItem pass kortesi
                      );
                    },
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // top image area with overlays
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Container(
                                height: 110,
                                width: double.infinity,
                                color: Colors.grey.shade200,
                                child: item.imageUrl != null
                                    ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                                    : const Icon(Icons.image, size: 40),
                              ),
                            ),

                            // price ribbon (left top)
                            Positioned(
                              left: 8,
                              top: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.92),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(item.priceText, style: const TextStyle(fontWeight: FontWeight.w700)),
                              ),
                            ),

                            // favorite icon (right top)
                            Positioned(
                              right: 6,
                              top: 6,
                              child: Material(
                                color: Colors.white.withOpacity(0.92),
                                shape: const CircleBorder(),
                                child: IconButton(
                                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : Colors.grey[700]),
                                  onPressed: () {
                                    setStateCard(() {
                                      isFav = !isFav;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: AppTypography.body1,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.priceText,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(children: [
                                const Icon(Icons.place_outlined, size: 14, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text(item.distanceText, style: AppTypography.body2),
                              ]),
                            ],
                          ),
                        ),
                        ],
                      ),
                    ); // close returned InkWell
                  },
                ),
              );
              },
            ),
          ),
        ),
      ],
    );
  }
}
