// lib/core/models/event.dart

class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime? endTime;
  final String locationName;
  final String hostName;
  final int goingCount;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    this.endTime,
    required this.locationName,
    required this.hostName,
    required this.goingCount,
  });
}
