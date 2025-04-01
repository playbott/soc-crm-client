import 'package:client/presentation/ui/theme/dark_theme.dart';
import 'package:client/presentation/ui/theme/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:client/presentation/router/router.dart';
import 'bloc/bloc.dart';
import 'global.dart';

void main() async {
  await appInitialization();
  runApp(const MyApp());
}

Future<void> appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.load();
  await Prefs.init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (BuildContext context, AuthState state) {
          if (state is AuthStateNotAuthorized && state.reload) {
            goRouter.go('/sign-in');
          }
        },
        child: BlocBuilder<LocalizationBloc, LocalizationState>(
          bloc: localizationBloc,
          builder: (context, localeState) {
            return BlocBuilder<ThemeBloc, ThemeState>(
              bloc: themeBloc,
              builder: (context, themeState) {
                return MaterialApp.router(
                  title:
                      (LocaleKeys.appTitle.i18n() == LocaleKeys.appTitle
                          ? 'Console — Meýdança'
                          : LocaleKeys.appTitle.i18n()),
                  debugShowCheckedModeBanner: false,
                  theme: LightThemeConst.lightTheme,
                  darkTheme: DarkThemeConst.darkTheme,
                  themeMode: themeState.themeMode,
                  locale: localeState.locale,
                  routerConfig: goRouter,
                  localizationsDelegates: [
                    GlobalWidgetsLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    LocalJsonLocalization.delegate,
                  ],
                  supportedLocales: supportedLocales,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
