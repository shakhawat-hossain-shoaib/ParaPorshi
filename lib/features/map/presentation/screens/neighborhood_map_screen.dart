// lib/features/map/presentation/screens/neighborhood_map_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';

class NeighborhoodMapScreen extends StatelessWidget {
  const NeighborhoodMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For UI-only phase, just a placeholder container.
    return Scaffold(
      appBar: AppBar(
        title: const Text('মানচিত্র'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'আপনার পাড়ার মানচিত্র (ডেমো)',
              style: AppTypography.body1,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              color: Colors.grey.shade200,
              child: const Center(
                child: Icon(Icons.map_outlined, size: 80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
