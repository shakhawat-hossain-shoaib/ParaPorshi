// lib/features/onboarding/presentation/screens/onboarding_welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';

class OnboardingWelcomeScreen extends StatelessWidget {
  const OnboardingWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // subtle background gradient for a fresh look
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE8F5E9), // very light green
              Color(0xFFF7F9FB),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),

                // Logo + title row
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
                    Text('পাড়াConnect', style: AppTypography.h1),
                  ],
                ),

                const SizedBox(height: 10),

                // Subtitle
                Text(
                  'আপনার ওয়ার্ড, মহল্লা আর আশেপাশের সব খবর, সেফটি অ্যালার্ট, কেনাবেচা আর সার্ভিস – এক অ্যাপে।',
                  style: AppTypography.body1,
                ),

                const SizedBox(height: 24),

                // Feature cards
                _featureCard(
                  icon: Icons.warning_amber_rounded,
                  title: 'লোকাল সতর্কতা',
                  subtitle: 'পানি/গ্যাস/বিদ্যুৎ সমস্যা, হারানো/পাওয়া, জরুরি অবস্থা।',
                ),
                const SizedBox(height: 12),
                _featureCard(
                  icon: Icons.shopping_bag_outlined,
                  title: 'পাড়ায় কেনাবেচা',
                  subtitle: 'ব্যবহৃত জিনিসপত্র পাড়া থেকেই কিনুন/বেচুন।',
                ),
                const SizedBox(height: 12),
                _featureCard(
                  icon: Icons.home_repair_service_outlined,
                  title: 'বিশ্বস্ত সার্ভিস',
                  subtitle: 'ইলেকট্রিশিয়ান, প্লাম্বার, টিউটর — সব একসাথে।',
                ),

                const Spacer(),

                // Primary full-width button (Sign up)
                _buildPrimaryButton(
                  label: 'নতুন অ্যাকাউন্ট তৈরি করুন',
                  onTap: () => context.go('/auth/sign-up'),
                ),

                const SizedBox(height: 12),

                // Outlined full-width button (Sign in)
                _buildOutlinedButton(
                  label: 'আগে থেকেই অ্যাকাউন্ট আছে? সাইন ইন করুন',
                  onTap: () => context.go('/auth/sign-in'),
                ),

                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // feature card widget
  Widget _featureCard({
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
                Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Full-width primary button
  Widget _buildPrimaryButton({required String label, required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  // Full-width outlined button
  Widget _buildOutlinedButton({required String label, required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary, width: 1.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.primary),
        ),
      ),
    );
  }
}
