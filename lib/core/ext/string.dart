import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

final tmCurrencyFormat = NumberFormat('#0', 'ru_RU');

extension StringUtils on String {
  String get formatDate {
    const maxChars = 8;
    String separator = '/';
    var value = replaceAll(separator, '');
    var output = '';

    for (int i = 0; i < min(value.length, maxChars); i++) {
      output += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        output += separator;
      }
    }

    return output;
  }

  String get extractDigits {
    if (isEmpty) return '';

    var output = '';
    for (var i = 0; i < length; i++) {
      if (int.tryParse(this[i]) != null) output += this[i];
    }
    return output;
  }

  String get formatAsPhone {
    final digits = extractDigits;
    if (digits.isEmpty) return '';
    final output = <String>[];
    output.add('+${digits.substring(0, 1)}');
    output.add(' (${digits.substring(1, 4)})');
    output.add(' ${digits.substring(4, 7)}-');
    output.add('${digits.substring(7, 9)}-');
    output.add(digits.substring(9, digits.length));
    return output.join();
  }

  String moneyFormat(double price) {
    String value = price.toString();
    if (value.length > 2) {
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
    }
    return value;
  }

  String moneyFormatInt(int price) {
    String value = price.toString();
    if (value.length > 2) {
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
    }
    return value;
  }

  String dateFormat(DateTime dateTime) {
    return '${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  void pp(dynamic message) {
    if (kDebugMode) {
      print(message);
    }
  }
}

String moneyTmFormat(double price) {
  return tmCurrencyFormat.format(price);
}
