// lib/features/settings/presentation/screens/verification_levels_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';

class VerificationLevelsScreen extends StatelessWidget {
  const VerificationLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ভেরিফিকেশন লেভেল'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Level 1: Phone Verified', style: AppTypography.body1),
            Text('• মোবাইল নাম্বার OTP দিয়ে ভেরিফাই', style: AppTypography.body2),
            const SizedBox(height: 16),
            Text('Level 2: Address Verified', style: AppTypography.body1),
            Text('• ওয়ার্ড/মহল্লা এবং বাসার ঠিকানা ভেরিফাই', style: AppTypography.body2),
            const SizedBox(height: 16),
            Text('Level 3: NID Verified (Optional)', style: AppTypography.body1),
            Text('• সরকারী NID তথ্যের মাধ্যমে ভেরিফিকেশন', style: AppTypography.body2),
          ],
        ),
      ),
    );
  }
}
