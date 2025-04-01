import 'package:client/presentation/ui/theme/constants.dart';
import 'package:client/presentation/ui/theme/text.dart';
import 'package:client/presentation/widgets/context.dart';
import 'package:client/presentation/widgets/controls/text.dart';

import '../../../global.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    this.color,
    required this.text,
    required this.onPressed,
    this.minWidth,
    this.height,
    this.shape,
    this.enabled = true,
    this.textColor,
  });

  final Color? color;
  final String text;
  final double? minWidth;
  final double? height;
  final VoidCallback? onPressed;
  final ShapeBorder? shape;
  final bool enabled;
  final Color? textColor;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool btnHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 120),
      child: ElevatedButton(
        onPressed: widget.enabled ? widget.onPressed : null,
        child: MyLabel(
          text: widget.text,
          size: FS.p7,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CommandButton extends StatelessWidget {
  const CommandButton({
    super.key,
    this.onPressed,
    this.prefixIcon,
    required this.text,
    this.suffixIcon,
    this.textColor,
    this.height,
    this.highlighted = false,
  });

  final VoidCallback? onPressed;
  final IconData? prefixIcon;
  final String text;
  final IconData? suffixIcon;
  final Color? textColor;
  final double? height;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode();
    return IntrinsicWidth(
      child: Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: onPressed,
            focusColor:
                (isDark
                    ? AppTheme.whiteColor.withAlpha(70)
                    : Theme.of(context).primaryColor.withAlpha(30)),
            highlightColor:
                (isDark
                    ? AppTheme.commandButtonColorDark.withAlpha(70)
                    : Theme.of(context).primaryColor.withAlpha(30)),
            hoverColor:
                (isDark
                    ? AppTheme.commandButtonColorDark.withAlpha(70)
                    : Theme.of(context).primaryColor.withAlpha(20)),
            splashColor: Theme.of(context).primaryColor.withAlpha(20),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              alignment: Alignment.center,
              height: height ?? 38,
              constraints: BoxConstraints(minWidth: 60),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: highlighted ? AppTheme.mainColor2.withAlpha(150) : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        prefixIcon,
                        color: highlighted ? Colors.white : textColor,
                      ),
                    ),
                  Text(
                    text,
                    style: TextStyle(
                      color: highlighted ? Colors.white : textColor,
                    ),
                  ),
                  if (suffixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(
                        suffixIcon,
                        color: highlighted ? Colors.white : textColor,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
