import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global.dart';


class ThemeBloc extends Bloc<ThemeModeEvent, ThemeState> {
  static const _storageKey = 'isDarkModeEnabled';

  ThemeBloc() : super(ThemeState(themeMode: null)) {
    on<ThemeModeEvent>((event, emit) async {
      if (event is ThemeModeSwitch) {
        bool isDarkModeEnabled = state.themeMode == ThemeMode.dark;

        await Prefs.setBool(_storageKey, !isDarkModeEnabled).whenComplete(() {
          emit(ThemeState(
            themeMode: isDarkModeEnabled ? ThemeMode.light : ThemeMode.dark,
          ));
        });
      }

      if (event is ThemeModeGet) {
        final isDarkModeEnabled = Prefs.getBool(_storageKey);

        if (isDarkModeEnabled == null) {
          emit(ThemeState(
            themeMode: ThemeMode.light,
          ));
        } else {
          emit(ThemeState(
            themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
          ));
        }
      }
    });
  }
}

class ThemeModeSwitch extends ThemeModeEvent {}

class ThemeModeGet extends ThemeModeEvent {}

class ThemeModeEvent {}

final class ThemeState {
  ThemeState({required this.themeMode});

  final ThemeMode? themeMode;
}
