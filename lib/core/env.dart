import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Env._();

  static late final String apiUrl;
  static late final String environment;

  static Future<void> load() async {
    const env = String.fromEnvironment('ENV', defaultValue: 'dev');

    await dotenv.load(fileName: '.env.$env');

    _isVariablesDefined();

    apiUrl = dotenv.env['API_URL']!;
    environment = dotenv.env['ENVIRONMENT']!;
  }

  static const _environments = ['API_URL', 'ENVIRONMENT'];

  static _isVariablesDefined() {
    for (var element in _environments) {
      if (dotenv.env[element] == null) {
        throw Exception('Environment: missing required variable: $element');
      }
    }
  }
}
