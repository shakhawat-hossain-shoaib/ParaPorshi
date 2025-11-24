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
        distanceText: '৫০০ মিটার দূরে',
        description: '২ বছর ব্যবহার, ভালো অবস্থা। শুধুমাত্র নিজে এসে নিয়ে যেতে হবে।',
      ),
      MarketplaceItem(
        id: '2',
        title: 'সাইকেল',
        priceText: '৳৩,০০০',
        distanceText: '৫০০ মিটার দূরে',
        description: 'শিশুদের সাইকেল, প্রায় নতুন।',
      ),
      MarketplaceItem(
        id: '3',
        title: 'ল্যাপটপ',
        priceText: '৳১৮,০০০',
        distanceText: '৫০০ মিটার দূরে',
        description: 'Core i5, 8GB RAM, 256GB SSD। অফিস কাজের জন্য ভালো।',
      ),
      MarketplaceItem(
        id: '4',
        title: 'খাট',
        priceText: '৳৬,৫০০',
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

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias, // ripple nicely clipped
                  child: InkWell(
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
                        // placeholder image area
                        Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.image, size: 40),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.distanceText,
                                style: AppTypography.body2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
