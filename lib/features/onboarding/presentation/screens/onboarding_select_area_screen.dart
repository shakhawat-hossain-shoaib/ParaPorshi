// lib/features/onboarding/presentation/screens/onboarding_select_area_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/app_text_field.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';
import 'package:hyperlocal_hub_bd/features/onboarding/presentation/widgets/onboarding_step_indicator.dart';

class OnboardingSelectAreaScreen extends StatelessWidget {
  const OnboardingSelectAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final areaController = TextEditingController(text: 'Ward 17, Mohammadpur');

    return Scaffold(
      appBar: AppBar(
        title: const Text('আপনার এলাকা নির্বাচন করুন'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OnboardingStepIndicator(currentStep: 2, totalSteps: 3),
            const SizedBox(height: 24),
            const Text(
              'আপনি মূলত কোন ওয়ার্ড/মহল্লায় থাকেন?',
              style: AppTypography.h2,
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: areaController,
              labelText: 'এলাকা/মহল্লা',
              hintText: 'উদাহরণ: Ward 17, Mohammadpur',
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.my_location_outlined, size: 18),
                SizedBox(width: 8),
                Text('বর্তমান লোকেশন ব্যবহার করুন', style: AppTypography.body2),
              ],
            ),
            const Spacer(),
            PrimaryButton(
              label: 'পরবর্তী',
              onPressed: () {
                context.push('/onboarding/interests');
              },
            ),
          ],
        ),
      ),
    );
  }
}
