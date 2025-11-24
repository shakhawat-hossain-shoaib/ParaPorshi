// lib/features/my_home/presentation/screens/home_details_screen.dart

import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import '../../data/my_home_repository.dart';
import '../../models/home_info.dart';
import '../widgets/home_info_row.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({super.key});

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  final _repo = MyHomeRepository();
  late Future<HomeInfo> _futureHome;

  @override
  void initState() {
    super.initState();
    _futureHome = _repo.fetchHomeInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home details'),
      ),
      body: FutureBuilder<HomeInfo>(
        future: _futureHome,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final home = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Flat & building',
                style: AppTypography.h2,
              ),
              const SizedBox(height: 12),
              HomeInfoRow(label: 'Flat', value: home.flatNumber),
              HomeInfoRow(label: 'Building', value: home.buildingName),
              HomeInfoRow(label: 'Address', value: home.addressLine),
              HomeInfoRow(label: 'Ward', value: home.wardName),
              const SizedBox(height: 24),
              const Text(
                'Ownership',
                style: AppTypography.h2,
              ),
              const SizedBox(height: 12),
              HomeInfoRow(label: 'Type', value: home.ownershipType),
              HomeInfoRow(
                  label: 'Residents',
                  value: '${home.residentsCount} people'),
              if (home.notes != null) ...[
                const SizedBox(height: 24),
                const Text('Notes', style: AppTypography.h2),
                const SizedBox(height: 8),
                Text(home.notes!, style: AppTypography.body2),
              ],
            ],
          );
        },
      ),
    );
  }
}
