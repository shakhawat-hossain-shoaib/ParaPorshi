// lib/features/create_post/presentation/screens/create_post_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/app_text_field.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String type = 'alert';
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final types = {
      'alert': 'অ্যালার্ট',
      'marketplace': 'কেনাবেচা',
      'general': 'সাধারণ পোস্ট',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন পোস্ট'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('পোস্ট টাইপ', style: AppTypography.body1),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: types.entries.map((entry) {
                final isSelected = type == entry.key;
                return ChoiceChip(
                  label: Text(entry.value),
                  selected: isSelected,
                  onSelected: (_) => setState(() => type = entry.key),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: titleController,
              labelText: 'শিরোনাম',
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: descController,
              labelText: 'বিবরণ',
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.add_a_photo_outlined, size: 20),
                SizedBox(width: 8),
                Text('ছবি যোগ করুন'),
              ],
            ),
            const Spacer(),
            PrimaryButton(
              label: 'পোস্ট করুন',
              onPressed: () {
                // Later: create post logic
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
