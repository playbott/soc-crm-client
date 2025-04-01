import 'package:client/presentation/widgets.dart';
import 'package:client/bloc/bloc.dart';
import 'package:client/global.dart';

class SignInTopPanel extends StatelessWidget {
  const SignInTopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BlocBuilder<AuthBloc, AuthState>(
                bloc: authBloc,
                builder: (context, state) {
                  return LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color:
                        (state is AuthStateWaiting) ? null : Colors.transparent,
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              bloc: authBloc,
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MyLabel(
                    text:
                        state is AuthStateWaiting
                            ? 'authWaitLbl'.i18n()
                            : 'loginLabel'.i18n(),
                    size: FS.p4,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
