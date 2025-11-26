// lib/features/services_directory/presentation/screens/services_list_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({super.key});

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'all';

  final List<Map<String, dynamic>> _providers = [
    {
      'id': 'p1',
      'name': 'Jewel Electric',
      'category': 'electrician',
      'categoryLabel': 'ইলেকট্রিশিয়ান',
      'rating': 4.7,
      'reviews': 56,
      'distance': '৩০০ মিটার দূরে',
      'phone': '017xxxxxxxx',
      'about': '২৪/৭ ইলেকট্রিশিয়ান সার্ভিস, ওয়ার্ড ১৭।',
    },
    {
      'id': 'p2',
      'name': 'Kabir Plumbing Service',
      'category': 'plumber',
      'categoryLabel': 'প্লাম্বার',
      'rating': 4.3,
      'reviews': 40,
      'distance': '৬০০ মিটার দূরে',
      'phone': '018xxxxxxxx',
      'about': 'অভিজ্ঞ প্লাম্বার, তৎক্ষণাৎ সার্ভিস।',
    },
    {
      'id': 'p3',
      'name': 'Cool Air AC Service',
      'category': 'ac',
      'categoryLabel': 'AC সার্ভিস',
      'rating': 4.5,
      'reviews': 23,
      'distance': '৯০০ মিটার দূরে',
      'phone': '019xxxxxxxx',
      'about': 'AC সার্ভিস এবং গ্যাস রিচার্জ।',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final searchText = _searchController.text.toLowerCase();

    final filtered = _providers.where((p) {
      final matchCategory =
          _selectedCategory == 'all' || p['category'] == _selectedCategory;

      final matchSearch = searchText.isEmpty ||
          (p['name'] as String).toLowerCase().contains(searchText) ||
          (p['categoryLabel'] as String).toLowerCase().contains(searchText);

      return matchCategory && matchSearch;
    }).toList();

    return SafeArea(
      child: Column(
        children: [
          // Search + Category row
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'সেবা সার্চ করুন…',
                      hintStyle: AppTypography.body2,
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: const BorderSide(
                          color: AppColors.divider,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedCategory,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: const [
                        DropdownMenuItem(value: 'all', child: Text('সব')),
                        DropdownMenuItem(
                          value: 'electrician',
                          child: Text('ইলেকট্রিশিয়ান'),
                        ),
                        DropdownMenuItem(value: 'plumber', child: Text('প্লাম্বার')),
                        DropdownMenuItem(value: 'ac', child: Text('AC সার্ভিস')),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() => _selectedCategory = value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // List
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final p = filtered[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withOpacity(0.08),
                      child: const Icon(
                        Icons.home_repair_service_outlined,
                        color: AppColors.primary,
                      ),
                    ),
                    title: Text(p['name'] as String, style: AppTypography.body1),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p['categoryLabel'] as String, style: AppTypography.body2),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text('${p['rating']}', style: const TextStyle(fontSize: 12)),
                            const SizedBox(width: 6),
                            Text('(${p['reviews']} রিভিউ)', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                            const SizedBox(width: 8),
                            const Text('•', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                            const SizedBox(width: 8),
                            Text(p['distance'] as String, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                          ],
                        ),
                      ],
                    ),

                    // ▶ Details: print debug then navigate with extra
                    trailing: TextButton(
                      onPressed: () {
                        // debug print so we can verify the exact Map being passed
                        // ignore: avoid_print
                        print('Navigating to provider details. provider: $p');

                          // navigate and pass provider map as extra (convert to Map as detail page expects)
                          context.push('/services/provider', extra: {
                            'id': p['id'],
                            'name': p['name'],
                            'role': p['category'],
                            'rating': p['rating'],
                            'reviews': p['reviews'],
                            'tags': <String>[],
                            'about': p['about'],
                            'services': <String>[],
                            'distance': p['distance'],
                            'phone': p['phone'],
                            'photos': <String>[],
                          });
                      },
                      child: const Text('ডিটেইলস', style: TextStyle(fontSize: 13, color: AppColors.primary)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
