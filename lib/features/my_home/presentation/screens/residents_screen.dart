// lib/features/my_home/presentation/screens/residents_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/features/my_home/data/my_home_repository.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/resident.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/widgets/resident_card.dart';
import 'package:hyperlocal_hub_bd/core/widgets/back_app_bar.dart';

class ResidentsScreen extends StatefulWidget {
  const ResidentsScreen({super.key});

  @override
  State<ResidentsScreen> createState() => _ResidentsScreenState();
}

class _ResidentsScreenState extends State<ResidentsScreen> {
  late Future<List<Resident>> _futureResidents;

  @override
  void initState() {
    super.initState();
    _futureResidents = myHomeRepository.getResidents();
  }

  Future<void> _refresh() async {
    setState(() {
      _futureResidents = myHomeRepository.getResidents();
    });
    await _futureResidents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: 'বাসিন্দা'),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<Resident>>(
          future: _futureResidents,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return ListView(children: [const SizedBox(height: 80), Center(child: Text('ত্রুটি: ${snapshot.error}'))]);
            }
            final residents = snapshot.data ?? [];
            if (residents.isEmpty) {
              return ListView(children: const [SizedBox(height: 80), Center(child: Text('কোনো বাসিন্দা যোগ করা নেই।'))]);
            }
            return ListView.builder(
              itemCount: residents.length,
              itemBuilder: (context, index) => ResidentCard(resident: residents[index]),
            );
          },
        ),
      ),
    );
  }
}
