import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

final tmCurrencyFormat = NumberFormat("#,##0.00", "ru_RU");

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
  return "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
}

String moneyTmFormat(double price) {
  return tmCurrencyFormat.format(price);
}

void pp(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}
