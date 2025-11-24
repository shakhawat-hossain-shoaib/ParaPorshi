// lib/features/auth/presentation/screens/sign_up_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _loading = false;

  Future<void> _onSignUp() async {
    if (_nameController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty) {
      // simple validation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('নাম এবং মোবাইল নম্বর দিন')),
      );
      return;
    }

    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 800)); // fake API call
    if (!mounted) return;
    setState(() => _loading = false);

    // TODO: এখানে সত্যিকারের sign up + OTP logic আসবে
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন অ্যাকাউন্ট তৈরি করুন'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'আপনার নাম এবং মোবাইল নম্বর দিয়ে পাড়াConnect এ নতুন অ্যাকাউন্ট তৈরি করুন।',
              style: AppTypography.body1,
            ),
            const SizedBox(height: 16),

            // Name
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'নাম',
                hintText: 'যেভাবে সবাই ডাকে...',
              ),
            ),
            const SizedBox(height: 12),

            // Phone
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'মোবাইল নম্বর',
                prefixText: '+88 ',
              ),
            ),

            const Spacer(),

            PrimaryButton(
              label: 'অ্যাকাউন্ট তৈরি করুন',
              onPressed: _onSignUp,
              isLoading: _loading,
            ),
          ],
        ),
      ),
    );
  }
}
