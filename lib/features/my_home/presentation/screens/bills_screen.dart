// lib/features/my_home/presentation/screens/bills_screen.dart

import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import '../../data/my_home_repository.dart';
import '../../models/bill.dart';
import '../widgets/bill_card.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({super.key});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  final _repo = MyHomeRepository();
  late Future<List<Bill>> _futureBills;

  @override
  void initState() {
    super.initState();
    _futureBills = _repo.fetchBills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bills'),
      ),
      body: FutureBuilder<List<Bill>>(
        future: _futureBills,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final bills = snapshot.data!;
          if (bills.isEmpty) {
            return const Center(child: Text('No bills yet.'));
          }

          return ListView(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Your recent utility & building bills.',
                  style: AppTypography.body2,
                ),
              ),
              const SizedBox(height: 8),
              ...bills.map((b) => BillCard(bill: b)),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
