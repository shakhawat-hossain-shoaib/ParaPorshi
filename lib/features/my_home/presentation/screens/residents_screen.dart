// lib/features/my_home/presentation/screens/residents_screen.dart

import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import '../../data/my_home_repository.dart';
import '../../models/resident.dart';
import '../widgets/resident_card.dart';

class ResidentsScreen extends StatefulWidget {
  const ResidentsScreen({super.key});

  @override
  State<ResidentsScreen> createState() => _ResidentsScreenState();
}

class _ResidentsScreenState extends State<ResidentsScreen> {
  final _repo = MyHomeRepository();
  late Future<List<Resident>> _futureResidents;

  @override
  void initState() {
    super.initState();
    _futureResidents = _repo.fetchResidents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Residents'),
      ),
      body: FutureBuilder<List<Resident>>(
        future: _futureResidents,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final residents = snapshot.data!;
          if (residents.isEmpty) {
            return const Center(child: Text('No residents added.'));
          }

          return ListView(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'People currently living in this home.',
                  style: AppTypography.body2,
                ),
              ),
              const SizedBox(height: 8),
              ...residents.map((r) => ResidentCard(resident: r)),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
