import 'package:jwt_decoder/jwt_decoder.dart';

bool isTokenValid(String? token) {
  if (token == null || token.isEmpty) return false;
  return !JwtDecoder.isExpired(token);
}
