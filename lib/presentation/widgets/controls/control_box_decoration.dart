import 'package:client/global.dart';
import 'package:client/presentation/ui/theme/constants.dart';
import 'package:client/presentation/widgets/context.dart';

BoxDecoration boxDecorationWiththemedBorder({
  bool filled = false,
  Color? fillColor,
  required BuildContext context,
}) {
  final isDark = context.isDarkMode();
  return BoxDecoration(
    color:
        filled
            ? (fillColor ??
                (isDark
                    ? AppTheme.inputFillColorDark
                    : AppTheme.inputFillColorLight))
            : null,
    borderRadius: BorderRadius.circular(FS.p8),
    border:
        filled
            ? null
            : Border.all(
              color: Theme.of(context).primaryColor.withAlpha(150),
              width: 1,
            ),
  );
}
