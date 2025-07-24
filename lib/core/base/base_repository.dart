import 'package:annale_driver/core/network/api_client.dart';

abstract class BaseRepository {
  final ApiClient apiClient;

  BaseRepository(this.apiClient);
}
