// lib/features/onboarding/presentation/screens/onboarding_interests_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';
import 'package:hyperlocal_hub_bd/features/onboarding/presentation/widgets/onboarding_step_indicator.dart';

class OnboardingInterestsScreen extends StatefulWidget {
  const OnboardingInterestsScreen({super.key});

  @override
  State<OnboardingInterestsScreen> createState() =>
      _OnboardingInterestsScreenState();
}

class _OnboardingInterestsScreenState extends State<OnboardingInterestsScreen> {
  final selected = <String>{};

  final interests = const [
    'সেফটি অ্যালার্ট',
    'কেনাবেচা',
    'সেবা/সার্ভিস',
    'ইভেন্ট',
    'চাকরি',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আপনার আগ্রহগুলো বাছাই করুন'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OnboardingStepIndicator(currentStep: 3, totalSteps: 3),
            const SizedBox(height: 24),
            Text(
              'আপনি কোন ধরনের পোস্ট বেশি দেখতে চান?',
              style: AppTypography.h2,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: interests.map((label) {
                final isSelected = selected.contains(label);
                return FilterChip(
                  label: Text(label),
                  selected: isSelected,
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        selected.add(label);
                      } else {
                        selected.remove(label);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            PrimaryButton(
              label: 'শুরু করুন',
              onPressed: () {
                // Later: navigate to home
              },
            ),
          ],
        ),
      ),
    );
  }
}
