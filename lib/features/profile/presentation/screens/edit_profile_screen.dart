// lib/features/profile/presentation/screens/edit_profile_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/features/profile/data/profile_repository.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _areaController;
  late TextEditingController _wardController;

  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    final profile = ProfileRepository.instance.profile;
    _nameController = TextEditingController(text: profile.name);
    _phoneController = TextEditingController(text: profile.phone);
    _areaController = TextEditingController(text: profile.area);
    _wardController = TextEditingController(text: profile.ward);
    _avatarPath = profile.avatarPath;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _areaController.dispose();
    _wardController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? picked =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (picked != null) {
      setState(() {
        _avatarPath = picked.path;
      });
    }
  }

  void _save() {
    if (_formKey.currentState?.validate() != true) return;

    final newData = UserProfileData(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      area: _areaController.text.trim(),
      ward: _wardController.text.trim(),
      avatarPath: _avatarPath,
    );

    ProfileRepository.instance.updateProfile(newData);

    // IMPORTANT: use go() so ProfileScreen is rebuilt with new data
    context.go('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('প্রোফাইল এডিট'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  children: [
                    _buildAvatarPreview(),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Basic info',
              style: AppTypography.body1
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'নাম',
              ),
              validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'নাম লিখুন' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'মোবাইল নম্বর',
              ),
              keyboardType: TextInputType.phone,
              validator: (v) =>
              (v == null || v.trim().length < 10) ? 'সঠিক নম্বর লিখুন' : null,
            ),
            const SizedBox(height: 24),
            Text(
              'Neighborhood',
              style: AppTypography.body1
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _areaController,
              decoration: const InputDecoration(
                labelText: 'এলাকা',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _wardController,
              decoration: const InputDecoration(
                labelText: 'ওয়ার্ড',
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _save,
                child: const Text('সেভ করুন'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarPreview() {
    if (_avatarPath != null && _avatarPath!.isNotEmpty) {
      return CircleAvatar(
        radius: 40,
        backgroundImage: FileImage(File(_avatarPath!)),
      );
    }

    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.primary.withOpacity(0.1),
      child: const Icon(
        Icons.person,
        size: 40,
      ),
    );
  }
}
