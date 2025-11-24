// lib/core/models/location_info.dart

class LocationInfo {
  final double latitude;
  final double longitude;
  final String areaName;
  final String wardName;

  LocationInfo({
    required this.latitude,
    required this.longitude,
    required this.areaName,
    required this.wardName,
  });
}
