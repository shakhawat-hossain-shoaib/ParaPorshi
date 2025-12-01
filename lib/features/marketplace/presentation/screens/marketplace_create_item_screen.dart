// lib/features/marketplace/presentation/screens/marketplace_create_item_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/app_text_field.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class MarketplaceCreateItemScreen extends StatefulWidget {
  const MarketplaceCreateItemScreen({super.key});

  @override
  State<MarketplaceCreateItemScreen> createState() =>
      _MarketplaceCreateItemScreenState();
}

class _MarketplaceCreateItemScreenState
    extends State<MarketplaceCreateItemScreen> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  String category = 'furniture';

  @override
  Widget build(BuildContext context) {
    debugPrint('MarketplaceCreateItemScreen built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন বিক্রয় পোস্ট'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ক্যাটাগরি', style: AppTypography.body1),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildCategoryChip('furniture', 'ফার্নিচার'),
                _buildCategoryChip('electronics', 'ইলেকট্রনিক্স'),
                _buildCategoryChip('books', 'বই'),
                _buildCategoryChip('other', 'অন্যান্য'),
              ],
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: titleController,
              labelText: 'শিরোনাম',
              hintText: 'যেমন: স্টাডি টেবিল',
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: priceController,
              labelText: 'দাম (৳)',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: descController,
              labelText: 'বিস্তারিত',
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Icon(Icons.add_a_photo_outlined, size: 20),
                SizedBox(width: 8),
                Text('ছবি যোগ করুন'),
              ],
            ),
            const Spacer(),
            PrimaryButton(
              label: 'পোস্ট করুন',
              onPressed: () {
                // Later: validation & API
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String value, String label) {
    final isSelected = category == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => setState(() => category = value),
    );
  }
}
