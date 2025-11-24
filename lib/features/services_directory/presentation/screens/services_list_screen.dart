// lib/features/services_directory/presentation/screens/services_list_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';

class ServicesListScreen extends StatelessWidget {
  const ServicesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy providers – similar to your design
    final providers = [
      {
        'name': 'Jewel Electric',
        'category': 'ইলেকট্রিশিয়ান',
        'rating': 4.7,
        'reviews': 56,
        'distance': '৩০০ মিটার দূরে',
      },
      {
        'name': 'Kabir Plumbing Service',
        'category': 'প্লাম্বার',
        'rating': 4.3,
        'reviews': 40,
        'distance': '৯০০ মিটার দূরে',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text('সেবা', style: AppTypography.h2),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: providers.length,
            itemBuilder: (context, index) {
              final p = providers[index];

              return Card(
                margin:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                elevation: 1,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  // পুরো card ক্লিকেবল
                  onTap: () {
                    context.push('/services/provider');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // icon circle
                        CircleAvatar(
                          radius: 24,
                          backgroundColor:
                          AppColors.primary.withOpacity(0.1),
                          child: const Icon(
                            Icons.business_center_outlined,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // main text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p['name'] as String,
                                style: AppTypography.body1.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                p['category'] as String,
                                style: AppTypography.body2,
                              ),
                              const SizedBox(height: 4),

                              // ⭐ rating + reviews + distance (overflow-safe)
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      size: 14, color: Colors.amber),
                                  const SizedBox(width: 2),
                                  Text(
                                    (p['rating'] as double)
                                        .toStringAsFixed(1),
                                    style: AppTypography.body2,
                                  ),
                                  const SizedBox(width: 6),
                                  // baki text flexible, ellipsis
                                  Flexible(
                                    child: Text(
                                      '(${p['reviews']} রিভিউ) • ${p['distance']}',
                                      style: AppTypography.body2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        // "ডিটেইলস" button – same navigation
                        TextButton(
                          onPressed: () {
                            context.push('/services/provider');
                          },
                          child: const Text(
                            'ডিটেইলস',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
