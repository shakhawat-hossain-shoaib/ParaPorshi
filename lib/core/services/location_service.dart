// lib/core/services/location_service.dart

class LocationService {
  Future<String> getCurrentAreaName() async {
    // Later: use geolocator. For now just fake.
    await Future.delayed(const Duration(milliseconds: 300));
    return 'Ward 17, Mohammadpur';
  }
}
