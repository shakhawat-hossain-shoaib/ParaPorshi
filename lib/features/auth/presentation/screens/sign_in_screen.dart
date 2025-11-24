// lib/features/auth/presentation/screens/sign_in_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _phoneController = TextEditingController();
  bool _loading = false;

  Future<void> _onSignIn() async {
    if (_phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('মোবাইল নম্বর দিন')),
      );
      return;
    }

    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 800)); // fake API call
    if (!mounted) return;
    setState(() => _loading = false);

    // TODO: এখানে সত্যিকারের sign in + OTP logic আসবে
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সাইন ইন করুন'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'আপনার মোবাইল নম্বর দিন, আমরা OTP পাঠাবো।',
              style: AppTypography.body1,
            ),
            const SizedBox(height: 16),

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
              label: 'সাইন ইন করুন',
              onPressed: _onSignIn,
              isLoading: _loading,
            ),
          ],
        ),
      ),
    );
  }
}
