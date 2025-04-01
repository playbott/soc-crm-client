import 'package:localization/localization.dart';
import 'package:queen_validators/queen_validators.dart';
import 'queen_validators/ip_address.dart';

class VIsRequired extends IsRequired {
  VIsRequired() : super('fieldIsRequired'.i18n());
}

class VIsNumeric extends IsNumber {
  VIsNumeric() : super('fieldIsNumeric'.i18n());
}

class VMinLength extends MinLength {
  VMinLength(min) : super(min, 'fieldLengthMin'.i18n([min.toString()]));
}

class VMaxLength extends MaxLength {
  VMaxLength(max) : super(max, 'fieldLengthMax'.i18n([max.toString()]));
}

class VIsIpAddress extends IsIpAddress {
  VIsIpAddress() : super('fieldIpAddress'.i18n());

  @override
  bool isValid(String input) {
    if (input.isEmpty) {
      return true;
    }

    return isIpAddress(input);
  }
}
