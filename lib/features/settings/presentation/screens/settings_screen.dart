// lib/features/settings/presentation/screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সেটিংস'),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('ভাষা'),
            subtitle: Text('বাংলা'),
          ),
          const Divider(),
          ListTile(
            title: const Text('নোটিফিকেশন'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('ভেরিফিকেশন লেভেল'),
            onTap: () {
              // Later: navigate to verification_levels_screen
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Terms & Privacy'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
