import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String timeFormatRu(time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}

extension DateTimeExtension on DateTime {
  int get lastDayOfMonth => DateTime(year, month + 1, 0).day;

  ///Format date time: dd.MM.yyyy HH:mm
  String get formatRuDateTime {
    String? locale;
    String pattern = 'dd.MM.yyyy HH:mm';
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  ///Format date time: dd.MM.yyyy
  String get formatRuDate {
    String? locale;
    String pattern = 'dd.MM.yyyy';
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  ///Format date: yyyy-MM-dd
  String get formatYMD {
    String? locale;
    String pattern = 'yyyy-MM-dd';
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String format({required String pattern}) {
    String? locale;
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

String oneHourPeriodStr(int hour) {
  return '${'${hour.toString().padLeft(2, '0')}:00'} - ${'${(hour + 1).toString().padLeft(2, '0')}:00'}';
}

class Week {
  int day;
  String shortName;
  String name;

  Week({required this.day, required this.shortName, required this.name});
}

class Month {
  int month;
  String name;
  String shortName;

  Month({required this.month, required this.shortName, required this.name});
}
