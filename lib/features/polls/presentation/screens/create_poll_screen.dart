// lib/features/polls/presentation/screens/create_poll_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/app_text_field.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class CreatePollScreen extends StatefulWidget {
  const CreatePollScreen({super.key});

  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  final questionController = TextEditingController();
  final options = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
  ];

  void _addOption() {
    setState(() {
      options.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন পোল তৈরি করুন'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: questionController,
              labelText: 'প্রশ্ন',
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Text('অপশনগুলো', style: AppTypography.body1),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AppTextField(
                      controller: options[index],
                      labelText: 'অপশন ${index + 1}',
                    ),
                  );
                },
              ),
            ),
            TextButton.icon(
              onPressed: _addOption,
              icon: const Icon(Icons.add),
              label: const Text('আরেকটি অপশন যোগ করুন'),
            ),
            const SizedBox(height: 8),
            PrimaryButton(
              label: 'পোল পোস্ট করুন',
              onPressed: () {
                // Later: validation + API
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
