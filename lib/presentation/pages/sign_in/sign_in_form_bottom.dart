import 'package:client/presentation/widgets.dart';
import 'package:client/bloc/bloc.dart';
import 'package:client/global.dart';

class SignInFormBottomPanel extends StatelessWidget {
  const SignInFormBottomPanel({
    super.key,
    this.showSignInTypeSwitchButton = false,
  });

  final bool showSignInTypeSwitchButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showSignInTypeSwitchButton)
          BlocBuilder<SignInFormTypeBloc, SignInFormTypeState>(
            bloc: signInFormTypeBloc,
            builder: (context, signInFormState) {
              return BlocBuilder<AuthBloc, AuthState>(
                bloc: authBloc,
                builder: (context, authState) {
                  return CommandButton(
                    text:
                        (signInFormState.type == SignInFormType.password)
                            ? 'loginViaPhoneNumber'.i18n()
                            : 'loginViaPassword'.i18n(),
                    textColor: Theme.of(context).primaryColor,
                    height: 30,
                    onPressed:
                        authState is AuthStateWaiting
                            ? null
                            : () {
                              signInFormTypeBloc.add(
                                SignInFormTypeEvent(
                                  (signInFormState.type ==
                                          SignInFormType.password)
                                      ? SignInFormType.phone
                                      : SignInFormType.password,
                                ),
                              );
                            },
                  );
                },
              );
            },
          ),
        Expanded(child: SizedBox.shrink()),
        BlocBuilder<LocalizationBloc, LocalizationState>(
          bloc: localizationBloc,
          builder: (context, localeState) {
            return Row(
              children: [
                IconButton(
                  alignment: Alignment.center,
                  icon: Icon(
                    context.isDarkMode()
                        ? Icons.light_mode_rounded
                        : Icons.mode_night,
                    color:
                        context.isDarkMode() ? Colors.yellow : Colors.black54,
                  ),
                  onPressed: () {
                    themeBloc.add(ThemeModeSwitch());
                  },
                ),
                IconButton(
                  alignment: Alignment.center,
                  icon: Text(
                    allLanguages[localeState.locale.languageCode]['flag'],
                  ),
                  onPressed: () {
                    var loc =
                        Prefs.getString('lancode') ??
                        supportedLocales[1].languageCode;
                    localizationBloc.add(
                      LocalizationEventLoad(
                        Locale((loc == 'ru' ? 'en' : 'ru')),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
