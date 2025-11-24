// lib/features/services_directory/presentation/screens/service_provider_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';

class ServiceProviderDetailScreen extends StatelessWidget {
  const ServiceProviderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Later you'll pass real provider data via router extra.
    return Scaffold(
      appBar: AppBar(
        title: const Text('সেবা প্রদানকারী'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: const Icon(Icons.build_outlined, size: 30),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jewel Electric',
                    style: AppTypography.h2,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ইলেকট্রিশিয়ান • ৩০০ মিটার দূরে',
                    style: AppTypography.body2,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text('4.8 (120 reviews)', style: AppTypography.body2),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'About',
            style: AppTypography.body1
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Experienced electrician for home wiring, light, fan, switch and small repair works in Ward 17 area. Available 9am–10pm.',
            style: AppTypography.body2,
          ),
          const SizedBox(height: 24),
          Text(
            'Contact',
            style: AppTypography.body1
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.call),
            title: const Text('Call'),
            subtitle: const Text('017XXXXXXXX'),
            onTap: () {
              // TODO: launch dialer
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text('Message'),
            subtitle: const Text('Chat inside ParaConnect'),
            onTap: () {
              // TODO: open in-app chat
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Services',
            style: AppTypography.body1
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Wrap(
            children: [
              _chip('Wiring & fitting'),
              _chip('Switch/Socket repair'),
              _chip('Fan & light installation'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: AppTypography.body2),
    );
  }
}
