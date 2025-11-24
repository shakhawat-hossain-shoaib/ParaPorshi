// lib/features/events/presentation/screens/events_list_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/models/event.dart';

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      EventModel(
        id: '1',
        title: 'রক্তদান ক্যাম্প',
        description: 'ওয়ার্ড কমিউনিটি সেন্টারে বিনামূল্যে রক্তদান কার্যক্রম।',
        startTime: DateTime.now().add(const Duration(days: 1)),
        endTime: null,
        locationName: 'Ward 17 Community Center',
        hostName: 'Ward 17 Office',
        goingCount: 32,
      ),
    ];

    if (events.isEmpty) {
      return const Center(child: Text('কোনো ইভেন্ট নেই।'));
    }

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final e = events[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.event_outlined),
            title: Text(e.title, style: AppTypography.body1),
            subtitle: Text(
              '${e.locationName}\n${e.goingCount} জন যাচ্ছেন',
              style: AppTypography.body2,
            ),
          ),
        );
      },
    );
  }
}
