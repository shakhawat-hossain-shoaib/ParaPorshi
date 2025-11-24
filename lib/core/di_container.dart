// lib/core/di_container.dart
import 'services/api_client.dart';

class DiContainer {
  DiContainer._internal();

  static final DiContainer instance = DiContainer._internal();

  late final ApiClient apiClient;

  void init() {
    apiClient = ApiClient();
  }
}
