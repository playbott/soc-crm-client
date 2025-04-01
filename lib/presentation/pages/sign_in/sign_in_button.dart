import 'package:client/global.dart';
import 'package:flutter/gestures.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 37),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: text,
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ),
    );
  }
}
