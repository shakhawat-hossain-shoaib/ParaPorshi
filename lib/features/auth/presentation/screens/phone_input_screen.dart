// lib/features/auth/presentation/screens/phone_input_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class PhoneInputScreen extends StatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  State<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  final _controller = TextEditingController();
  bool _loading = false;
  bool _isSignUp = true; // true = sign up, false = sign in

  Future<void> _continue() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 800)); // fake delay
    if (!mounted) return;
    setState(() => _loading = false);

    // TODO: এখানে auth logic আসবে – এখন শুধু home এ পাঠাচ্ছি
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final titleText = _isSignUp ? 'অ্যাকাউন্ট তৈরি করুন' : 'সাইন ইন করুন';

    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle sign in / sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('নতুন অ্যাকাউন্ট'),
                  selected: _isSignUp,
                  selectedColor: AppColors.primary.withOpacity(0.12),
                  onSelected: (_) {
                    setState(() {
                      _isSignUp = true;
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('আগে থেকেই আছে'),
                  selected: !_isSignUp,
                  selectedColor: AppColors.primary.withOpacity(0.12),
                  onSelected: (_) {
                    setState(() {
                      _isSignUp = false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'লগইন বা অ্যাকাউন্ট তৈরি করতে আপনার মোবাইল নম্বর ব্যবহার করুন। আমরা OTP পাঠাবো।',
              style: AppTypography.body1,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'মোবাইল নম্বর',
                prefixText: '+88 ',
              ),
            ),
            const Spacer(),
            PrimaryButton(
              label: _isSignUp ? 'অ্যাকাউন্ট তৈরি করুন' : 'সাইন ইন করুন',
              onPressed: _continue,
              isLoading: _loading,
            ),
          ],
        ),
      ),
    );
  }
}
