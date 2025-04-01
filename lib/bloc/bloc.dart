import 'bloc.dart';
import 'package:client/global.dart';
export 'package:client/bloc/auth/auth_base.dart';
export 'app/localization/localization_bloc.dart';
export 'app/router_bloc/router_bloc.dart';
export 'role/role_bloc.dart';
export 'auth/auth_bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:client/bloc/file/file-upload_bloc.dart';
export 'app/login_form_type_bloc.dart';
export 'country/country_bloc.dart';

export 'user/user_bloc.dart';
export 'app/global_msg_bloc/global_msg_bloc.dart';
export 'app/theme/theme_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(
    lazy: false,
    create:
        (_) =>
            localizationBloc..add(
              LocalizationEventLoad(
                Locale(
                  Prefs.getString('lancode') ??
                      supportedLocales[1].languageCode,
                ),
              ),
            ),
  ),
  BlocProvider(lazy: false, create: (_) => themeBloc..add(ThemeModeGet())),
  BlocProvider(create: (_) => userByIdBloc),
  BlocProvider(create: (_) => fileAlbumUploadBloc),
  BlocProvider(create: (_) => fileArtistUploadBloc),
  BlocProvider(create: (_) => fileGenreUploadBloc),
  BlocProvider(create: (_) => fileCountryUploadBloc),
  BlocProvider(create: (_) => fileCompanyUploadBloc),
  BlocProvider(create: (_) => countryBloc),
  BlocProvider(create: (_) => countryInfoPageBloc),
  BlocProvider(create: (_) => countryTableBloc),
  BlocProvider(create: (_) => rolesAllBloc),
  BlocProvider(create: (_) => roleInfoPageBloc),
  BlocProvider(create: (_) => roleTableBloc),
  BlocProvider(create: (_) => globalMessageBloc),
  BlocProvider(create: (_) => signInFormTypeBloc),
  BlocProvider(lazy: false, create: (_) => routerBloc),
];

CountryBloc countryBloc = CountryBloc();
CountryBloc countryInfoPageBloc = CountryBloc();
CountryBloc countryTableBloc = CountryBloc();

RoleBloc rolesAllBloc = RoleBloc();
RoleBloc roleInfoPageBloc = RoleBloc();
RoleBloc roleTableBloc = RoleBloc();

UserBloc userByIdBloc = UserBloc();
UserBloc usersTableBloc = UserBloc();

FileUploadBloc fileTrackUploadBloc = FileUploadBloc();
FileUploadBloc fileAlbumUploadBloc = FileUploadBloc();
FileUploadBloc fileCompanyUploadBloc = FileUploadBloc();
FileUploadBloc fileArtistUploadBloc = FileUploadBloc();
FileUploadBloc fileGenreUploadBloc = FileUploadBloc();
FileUploadBloc fileCountryUploadBloc = FileUploadBloc();

AuthBloc authBloc = AuthBloc();

SignInFormTypeBloc signInFormTypeBloc = SignInFormTypeBloc();
LocalizationBloc localizationBloc = LocalizationBloc();
RouterBloc routerBloc = RouterBloc();
ThemeBloc themeBloc = ThemeBloc();
