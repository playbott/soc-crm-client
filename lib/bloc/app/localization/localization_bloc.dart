import 'package:client/data/entities/title/title.dart';
import 'package:client/data/datasources/locale/shared_prefs.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:flutter_bloc/flutter_bloc.dart';

final directories = ['lib/i18n'];
final supportedLocales = [
  const Locale('en', 'US'),
  const Locale('ru', 'RU'),
];

const Map<String, dynamic> allLanguages = {
  'en': {'flag': '🇹🇲', 'title': 'Türkmen'},
  'ru': {'flag': '🇷🇺', 'title': 'Русский'},
};

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc()
    : super(
        LocalizationState(
          locale: Locale(
            Prefs.getString('lancode') ?? supportedLocales[0].languageCode,
          ),
        ),
      ) {
    on<LocalizationEventLoad>((event, emit) async {
      Locale currentLocale = Locale(
        Prefs.getString('lancode') ?? supportedLocales[0].languageCode,
      );
      bool saved = await Prefs.setString(
        'lancode',
        (event.locale ?? currentLocale).languageCode,
      );
      emit(
        LocalizationState(
          locale: event.locale ?? currentLocale,
          reload: event.reload,
        ),
      );
    });
  }

  String tr(Title title) {
    final code = state.locale.languageCode;
    switch (code) {
      case "en":
        if (title.tm.isEmpty) {
          return title.en;
        }
        return title.tm;
      case "ru":
        return title.ru;
      case "tm":
        return title.tm;
      default:
        return title.tm;
    }
  }
}

final class LocalizationEventLoad extends LocalizationEvent {
  LocalizationEventLoad(this.locale, {this.reload = false});

  final Locale? locale;
  final bool reload;
}

final class LocalizationEvent {}

final class LocalizationState {
  LocalizationState({required this.locale, this.reload = false});

  final Locale locale;
  final bool reload;
}
