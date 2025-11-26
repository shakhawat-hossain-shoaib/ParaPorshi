// lib/features/profile/presentation/screens/profile_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/features/profile/data/profile_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = ProfileRepository.instance.profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('প্রোফাইল'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              // 👉 go_router: open edit screen
              context.push('/profile/edit');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          Center(
            child: _buildAvatar(profile),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              profile.name,
              style: AppTypography.h2,
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              '${profile.area}, ${profile.ward}',
              style: AppTypography.body2,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Text(
            'Account info',
            style: AppTypography.body1
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          _infoRow('Name', profile.name),
          _infoRow('Phone', profile.phone),
          _infoRow('Area', profile.area),
          _infoRow('Ward', profile.ward),
          const SizedBox(height: 24),
          Text(
            'Neighborhood',
            style: AppTypography.body1
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          _infoRow('Area', profile.area),
          _infoRow('Ward', profile.ward),
        ],
      ),
    );
  }

  Widget _buildAvatar(UserProfileData profile) {
    if (profile.avatarPath != null && profile.avatarPath!.isNotEmpty) {
      return CircleAvatar(
        radius: 36,
        backgroundImage: FileImage(File(profile.avatarPath!)),
      );
    }

    return CircleAvatar(
      radius: 36,
      backgroundColor: AppColors.primary.withOpacity(0.1),
      child: const Icon(
        Icons.person,
        size: 36,
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: AppTypography.body2,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: AppTypography.body1,
            ),
          ),
        ],
      ),
    );
  }
}
