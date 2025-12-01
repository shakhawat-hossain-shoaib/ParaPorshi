// lib/features/polls/presentation/screens/create_poll_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/app_text_field.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class CreatePollScreen extends StatefulWidget {
  const CreatePollScreen({super.key});

  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  final _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  void _addOption() {
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }

  void _removeOption(int index) {
    if (_optionControllers.length > 2) {
      setState(() {
        _optionControllers.removeAt(index);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('কমপক্ষে ২টি অপশন থাকতে হবে')),
      );
    }
  }

  void _createPoll() {
    final question = _questionController.text.trim();
    final options = _optionControllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    if (question.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('পোলের প্রশ্ন লিখুন')),
      );
      return;
    }

    if (options.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('কমপক্ষে ২টি অপশন দিন')),
      );
      return;
    }

    // TODO: Implement actual poll creation logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('পোল তৈরি করা হয়েছে!')),
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন পোল তৈরি করুন'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('প্রশ্ন', style: AppTypography.h2),
            const SizedBox(height: 8),
            AppTextField(
              controller: _questionController,
              hintText: 'আপনার প্রশ্ন লিখুন...',
              maxLines: 2,
            ),
            const SizedBox(height: 24),
            const Text('অপশনসমূহ', style: AppTypography.h2),
            const SizedBox(height: 8),
            ..._optionControllers.asMap().entries.map((entry) {
              final index = entry.key;
              final controller = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: controller,
                        hintText: 'অপশন ${index + 1}',
                      ),
                    ),
                    if (_optionControllers.length > 2)
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                        onPressed: () => _removeOption(index),
                      ),
                  ],
                ),
              );
            }),
            TextButton.icon(
              onPressed: _addOption,
              icon: const Icon(Icons.add),
              label: const Text('আরও অপশন যোগ করুন'),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              label: 'পোল পোস্ট করুন',
              onPressed: _createPoll,
            ),
          ],
        ),
      ),
    );
  }
}
