import 'package:client/presentation/widgets.dart';
import 'package:client/bloc/auth/auth_bloc_phone.dart';
import 'package:client/bloc/bloc.dart';
import 'package:client/data/entities/user/otp_send_data.dart';
import 'package:client/global.dart';
import 'package:client/presentation/widgets/controls/dialog.dart';
import 'sign_in_form_bottom.dart';
import 'sign_in_form_password.dart';
import 'sign_in_form_phone.dart';
import 'sign_in_form_top_panel.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    authBloc.stream.listen((state) async {
      if (mounted) {
        if (state is AuthStateAuthorized) {
          context.go('/main');
        }
      }

      if (mounted) {
        if (state is PhoneAuthStateFailedSignIn) {
          await showMyDialogOK(
            context,
            title: LocaleKeys.login.i18n(),
            msg: LocaleKeys.signInError.i18n(),
            okAction: () {},
          ).whenComplete(() {
            if (mounted) {
              context.pop();
            }
          });
        }
      }
    });
    super.initState();
  }

  submitPhoneNumber() async {
    phoneNumberController.text.length != 8
        ? await showMyDialogOK(
          context,
          title: 'error'.i18n(),
          msg: 'fillAllFields'.i18n(),
          okAction: () {},
        )
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
    return Scaffold(
      backgroundColor:
          context.isDarkMode()
              ? Color.fromRGBO(33, 41, 42, 1.0)
              : Theme.of(context).primaryColorDark,
      body: Center(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IntrinsicWidth(
                  child: IntrinsicHeight(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 350,
                        color:
                            context.isDarkMode()
                                ? AppTheme.surfaceColor
                                : Theme.of(context).cardColor,
                        constraints: BoxConstraints(maxHeight: 500),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SignInTopPanel(),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 0,
                              ),
                              child: BlocBuilder<
                                SignInFormTypeBloc,
                                SignInFormTypeState
                              >(
                                bloc: signInFormTypeBloc,
                                builder: (context, state) {
                                  switch (state.type) {
                                    case SignInFormType.password:
                                      return SignInFormPassword();
                                    case SignInFormType.phone:
                                      return SignInFormPhone();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 5,
                                bottom: 5,
                              ),
                              child: SignInFormBottomPanel(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
