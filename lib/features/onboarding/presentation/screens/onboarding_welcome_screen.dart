// lib/features/onboarding/presentation/screens/onboarding_welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class OnboardingWelcomeScreen extends StatelessWidget {
  const OnboardingWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE8F5E9),
              Color(0xFFF7F9FB),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                // Logo / App name
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'পাড়াConnect',
                      style: AppTypography.h1,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'আপনার ওয়ার্ড, মহল্লা আর আশেপাশের সব খবর, সেফটি অ্যালার্ট, কেনাবেচা আর সার্ভিস – এক অ্যাপে।',
                  style: AppTypography.body1,
                ),
                const SizedBox(height: 32),

                // Feature highlights
                _buildHighlightTile(
                  icon: Icons.warning_amber_rounded,
                  title: 'লোকাল সেফটি অ্যালার্ট',
                  subtitle: 'গ্যাস/পানি/বিদ্যুৎ সমস্যা, হারানো/পাওয়া, জরুরি অবস্থা।',
                ),
                const SizedBox(height: 12),
                _buildHighlightTile(
                  icon: Icons.shopping_bag_outlined,
                  title: 'পাড়ায় কেনাবেচা',
                  subtitle: 'ব্যবহৃত জিনিসপত্র পাড়া থেকেই কিনুন/বেচুন।',
                ),
                const SizedBox(height: 12),
                _buildHighlightTile(
                  icon: Icons.home_repair_service_outlined,
                  title: 'বিশ্বস্ত সার্ভিস',
                  subtitle: 'ইলেকট্রিশিয়ান, প্লাম্বার, টিউটর – সব একসাথে।',
                ),

                const Spacer(),

                // ➜ SIGN UP BUTTON
                PrimaryButton(
                  label: 'নতুন অ্যাকাউন্ট তৈরি করুন',
                  onPressed: () => context.go('/auth/sign-up'),
                ),
                const SizedBox(height: 8),

                // ➜ SIGN IN BUTTON
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => context.go('/auth/sign-in'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size.fromHeight(44),
                    ),
                    child: const Text('আগে থেকেই অ্যাকাউন্ট আছে? সাইন ইন করুন'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
