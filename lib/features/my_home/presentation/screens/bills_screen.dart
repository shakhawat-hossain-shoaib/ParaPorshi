// lib/features/my_home/presentation/screens/bills_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/features/my_home/data/my_home_repository.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/bill.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/widgets/bill_card.dart';
import 'package:hyperlocal_hub_bd/core/widgets/back_app_bar.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({super.key});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  late Future<List<Bill>> _futureBills;

  @override
  void initState() {
    super.initState();
    _futureBills = myHomeRepository.getBills();
  }

  Future<void> _refresh() async {
    setState(() {
      _futureBills = myHomeRepository.getBills();
    });
    await _futureBills;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: 'বিলসমূহ'),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<Bill>>(
          future: _futureBills,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return ListView(children: [const SizedBox(height: 80), Center(child: Text('ত্রুটি: ${snapshot.error}'))]);
            }
            final bills = snapshot.data ?? [];
            if (bills.isEmpty) {
              return ListView(children: const [SizedBox(height: 80), Center(child: Text('কোনো বিল নেই।'))]);
            }
            return ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) => BillCard(bill: bills[index]),
            );
          },
        ),
      ),
    );
  }
}
