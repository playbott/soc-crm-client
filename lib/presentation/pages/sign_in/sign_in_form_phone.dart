import 'package:client/presentation/widgets.dart';
import 'package:client/bloc/auth/auth_bloc_phone.dart';
import 'package:client/bloc/bloc.dart';
import 'package:client/global.dart';
import 'package:client/presentation/widgets/controls/dialog.dart';
import 'package:client/presentation/widgets/controls/loading.dart';
import 'package:client/data/entities/user/otp_send_data.dart';
import 'otp_form.dart';

class SignInFormPhone extends StatefulWidget {
  const SignInFormPhone({super.key});

  @override
  State<SignInFormPhone> createState() => _SignInFormPhoneState();
}

class _SignInFormPhoneState extends State<SignInFormPhone> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    authBloc.stream.listen((state) async {
      if (state is AuthStateAuthorized) {
        context.go('/tracks');
      }

      if (state is PhoneAuthStateFailedSignIn) {
        await showMyDialogOK(context,
                title: 'login'.i18n(),
                msg: 'signInError'.i18n(),
                okAction: () {})
            .whenComplete(() => context.pop());
      }
    });
    super.initState();
  }

  submitPhoneNumber() async {
    phoneNumberController.text.length != 8
        ? await showMyDialogOK(context,
            title: 'error'.i18n(), msg: 'fillAllFields'.i18n(), okAction: () {})
        : authBloc.add(
            PhoneAuthEventSendOTPCode(
              otpSendData: OTPSendData(
                phoneNumber: '+993${phoneNumberController.text}',
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
              if (state is PhoneAuthStateOTPSent) {
                return CodeVerificationForm(
                  signInFunc: () {},
                );
              }
              return const SizedBox.shrink();
            }),
        BlocBuilder<AuthBloc, AuthState>(
            bloc: authBloc,
            builder: (context, state) {
              if (state is AuthStateWaiting) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Loading(),
                  ],
                );
              }
              if (state is AuthStateNotInitialized ||
                  state is AuthStateNotAuthorized ||
                  state is PhoneAuthStateFailedOTPSend ||
                  state is PhoneAuthStateFailedSignIn) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //TODO: phone number input
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                            text: 'sendCode'.i18n(),
                            onPressed: () async {
                              await submitPhoneNumber();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
      ],
    );
  }
}
