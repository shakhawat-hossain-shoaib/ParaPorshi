// lib/core/services/api_client.dart

/// Placeholder API client for UI-only phase.
/// Later replace with real HTTP logic.
class ApiClient {
  Future<void> fakeDelay([int ms = 500]) async {
    await Future.delayed(Duration(milliseconds: ms));
  }
}
