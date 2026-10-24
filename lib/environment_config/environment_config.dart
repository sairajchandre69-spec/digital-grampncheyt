import 'package:flutter_dotenv/flutter_dotenv.dart';

DotEnv dotEnv=DotEnv();

class EnvironmentConfig {
  EnvironmentConfig._();
    static var baseUrlApi = dotEnv.env['BASE_URL'];
}