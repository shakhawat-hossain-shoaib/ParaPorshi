// lib/features/my_home/presentation/screens/my_home_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/loading_indicator.dart';
import '../../data/my_home_repository.dart';
import '../../models/home_info.dart';
import '../widgets/my_home_header.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final _repo = MyHomeRepository();
  late Future<HomeInfo> _futureHome;

  @override
  void initState() {
    super.initState();
    _futureHome = _repo.fetchHomeInfo();
  }

  @override
  Widget build(BuildContext context) {
    // No Scaffold here – parent (HomeScreen) already has it
    return FutureBuilder<HomeInfo>(
      future: _futureHome,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingIndicator();
        }

        final home = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHomeHeader(
              homeInfo: home,
              onDetailsTap: () {
                context.push('/my-home/details');
              },
              onBillsTap: () {
                context.push('/my-home/bills');
              },
              onResidentsTap: () {
                context.push('/my-home/residents');
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(
                'Quick overview',
                style: AppTypography.body1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Here you’ll see upcoming bills, building notices and home-related alerts.',
                style: AppTypography.body2,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Text(
                  'More My Home features coming soon.\n(Owner/tenant tools, bill tracking, complaints, etc.)',
                  style: AppTypography.body2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
