import 'package:client/presentation/widgets.dart';
import 'package:client/bloc/auth/auth_bloc_password.dart';
import 'package:client/data/entities/user/sign_in_password_data.dart';

import '/bloc/bloc.dart';
import '/global.dart';
import '/presentation/widgets/controls/dialog.dart';

class SignInFormPassword extends StatefulWidget {
  const SignInFormPassword({super.key});

  @override
  State<SignInFormPassword> createState() => _SignInFormPasswordState();
}

class _SignInFormPasswordState extends State<SignInFormPassword> {
  final TextFieldOptions userNameFieldOptions = TextFieldOptions(
    rules: [
      IsRequired('fieldRequired'.i18n()),
      MinLength(3, 'minLength'.i18n(['3'])),
      MaxLength(255, 'maxLength'.i18n(['255'])),
    ],
  );

  final TextFieldOptions passwordFieldOptions = TextFieldOptions(
    rules: [
      IsRequired('fieldRequired'.i18n()),
      MinLength(8, 'minLength'.i18n(['8'])),
      MaxLength(255, 'maxLength'.i18n(['255'])),
    ],
  );

  submitLogin() async {
    (userNameFieldOptions.controller?.text ?? '').length < 3 ||
            (passwordFieldOptions.controller?.text ?? '').length < 8
        ? await showMyDialogOK(
          context,
          title: 'error'.i18n(),
          msg: 'fillAllFields'.i18n(),
          okAction: () {},
        )
        : authBloc.add(
          PasswordAuthEventSignIn(
            signInData: SignInPasswordRequestData(
              userName: (userNameFieldOptions.controller?.text ?? '').trim(),
              password: (passwordFieldOptions.controller?.text ?? '').trim(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          bloc: authBloc,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextBox(
                  options: (userNameFieldOptions)..controller?.text = 'admin',
                  onSubmitted: (value) {},
                  enabled: state is! AuthStateWaiting,
                  label: '${'userName'.i18n()}:',
                  hintText: 'userNameEnterLbl'.i18n(),
                  filled: true,
                ),
                SizedBox(height: 10),
                MyTextBox(
                  options: passwordFieldOptions..controller?.text = 'administrator',
                  onSubmitted: (value) {},
                  enabled: state is! AuthStateWaiting,
                  label: '${'password'.i18n()}:',
                  hintText: 'passwordEnterLbl'.i18n(),
                  filled: true,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: 'login'.i18n(),
                      onPressed:
                          state is AuthStateWaiting
                              ? null
                              : () async {
                                submitLogin();
                              },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
