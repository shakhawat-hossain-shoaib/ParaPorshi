// lib/features/alerts/presentation/screens/create_alert_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/app_text_field.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class CreateAlertScreen extends StatefulWidget {
  const CreateAlertScreen({super.key});

  @override
  State<CreateAlertScreen> createState() => _CreateAlertScreenState();
}

class _CreateAlertScreenState extends State<CreateAlertScreen> {
  String category = 'safety';
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন সতর্কতা'),
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
                ChoiceChip(
                  label: const Text('নিরাপত্তা'),
                  selected: category == 'safety',
                  onSelected: (_) => setState(() => category = 'safety'),
                ),
                ChoiceChip(
                  label: const Text('গ্যাস/পানি/বিদ্যুৎ'),
                  selected: category == 'utility',
                  onSelected: (_) => setState(() => category = 'utility'),
                ),
                ChoiceChip(
                  label: const Text('হারানো/পাওয়া'),
                  selected: category == 'lost',
                  onSelected: (_) => setState(() => category = 'lost'),
                ),
                ChoiceChip(
                  label: const Text('অন্যান্য'),
                  selected: category == 'other',
                  onSelected: (_) => setState(() => category = 'other'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: titleController,
              labelText: 'শিরোনাম',
              hintText: 'যেমন: গ্যাস লিকের সন্দেহ',
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: descController,
              labelText: 'বিস্তারিত',
              maxLines: 4,
              hintText: 'সংক্ষিপ্তভাবে লিখুন, কী হয়েছে...',
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Icon(Icons.add_a_photo_outlined, size: 20),
                SizedBox(width: 8),
                Text('ছবি যোগ করুন'),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.location_on_outlined, size: 20),
                SizedBox(width: 8),
                Text('লোকেশন: Ward 17, Mohammadpur'),
              ],
            ),
            const Spacer(),
            PrimaryButton(
              label: 'পোস্ট করুন',
              onPressed: () {
                // Later: validation and API
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
