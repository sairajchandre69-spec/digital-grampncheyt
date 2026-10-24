import 'package:flutter_folder_structure/environment_config/environment_config.dart';

class EndPoint {
  EndPoint._();

  static const String _apiPath = 'auth/api/';

  //Environment URLS :
  static String get appBaseUrl {
    final baseUrl = EnvironmentConfig.baseUrlApi?.trim();
    if (baseUrl == null || baseUrl.isEmpty) {
      throw StateError('BASE_URL is not configured for this environment.');
    }
    return baseUrl;
  }

  static const String loginUrl = '$_apiPath/login';
}
