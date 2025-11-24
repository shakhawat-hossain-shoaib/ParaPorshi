// lib/features/events/presentation/screens/event_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/models/event.dart';
import 'package:hyperlocal_hub_bd/core/widgets/primary_button.dart';

class EventDetailScreen extends StatelessWidget {
  final EventModel event;

  const EventDetailScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final dateText =
        '${event.startTime.day}-${event.startTime.month}-${event.startTime.year}';

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: AppTypography.h2),
            const SizedBox(height: 8),
            Text('তারিখ: $dateText', style: AppTypography.body2),
            const SizedBox(height: 4),
            Text('স্থান: ${event.locationName}', style: AppTypography.body2),
            const SizedBox(height: 8),
            Text('আয়োজক: ${event.hostName}', style: AppTypography.body2),
            const SizedBox(height: 16),
            const Text('বিস্তারিত', style: AppTypography.body1),
            const SizedBox(height: 4),
            Text(event.description, style: AppTypography.body2),
            const SizedBox(height: 16),
            Text('${event.goingCount} জন যাচ্ছেন', style: AppTypography.body2),
            const Spacer(),
            PrimaryButton(
              label: 'আমি যাব',
              onPressed: () {
                // Later: RSVP logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
