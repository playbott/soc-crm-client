import 'package:client/presentation/widgets.dart';
import 'package:client/global.dart';
import 'countdown_timer.dart';

class CodeVerificationForm extends StatefulWidget {
  const CodeVerificationForm({required this.signInFunc, super.key});

  final void Function() signInFunc;

  @override
  State<CodeVerificationForm> createState() => _CodeVerificationFormState();
}

class _CodeVerificationFormState extends State<CodeVerificationForm> {
  TextEditingController otpFieldController = TextEditingController();
  FocusNode otpCodeFieldFocusNode = FocusNode();

  @override
  void initState() {
    otpCodeFieldFocusNode.requestFocus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    Color foregroundColor =
        themeMode == Brightness.light ? Colors.white : Colors.white60;
    return Container(
      width: 400,
      padding: EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.square(
            child: Lottie.asset(
              width: null,
              height: MediaQuery.of(context).size.height * 0.2,
              'resources/animations/lottie/otp-code-01.json',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MyLabel(
            text: 'wait30SecForOTP'.i18n(),
            color: foregroundColor,
            align: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: CountdownTimer(
                      duration: const Duration(seconds: 60),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          widget.signInFunc();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: MyLabel(
                            text: 'resendOTP'.i18n(),
                            size: FS.p6,
                            align: TextAlign.center,
                            color: foregroundColor,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
