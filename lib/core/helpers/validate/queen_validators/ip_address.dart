import 'package:queen_validators/queen_validators.dart';

class IsIpAddress extends TextValidationRule {
  const IsIpAddress([String? error]) : super(error);

  @override
  bool isValid(String input) {
    if (input.isEmpty) {
      return true;
    }

    return isIpAddress(input);
  }

  @override
  String toString() => 'validation.is_ip_address';
}

bool isIpAddress(Object? input) {
  if (input == null || input is! String) {
    return false;
  } else {
    final ipParts = input.split('.');
    if (ipParts.length != 4) {
      return false;
    }
    bool isValid = true;
    for (final part in ipParts) {
      try {
        final int value = int.parse(part);
        if (value < 0 || value > 255) {
          isValid = false;
          break;
        }
      } catch (e) {
        isValid = false;
        break;
      }
    }
    return isValid;
  }
}
