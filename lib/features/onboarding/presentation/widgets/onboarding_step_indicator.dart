// lib/features/onboarding/presentation/widgets/onboarding_step_indicator.dart
import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';

class OnboardingStepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const OnboardingStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        final isActive = index < currentStep;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: isActive ? AppColors.primary : AppColors.divider,
            ),
          ),
        );
      }),
    );
  }
}
