import 'package:client/presentation/ui/theme/text.dart';
import 'package:client/presentation/widgets/controls/control_box_decoration.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

import '../../../../global.dart';

CustomDropdownDisabledDecoration customDropdownDisabledDecoration(
  BuildContext context, {
  bool filled = false,
}) {
  final boxDecoration = boxDecorationWiththemedBorder(
    context: context,
    filled: filled,
  );
  return CustomDropdownDisabledDecoration(
    fillColor: Theme.of(context).cardColor,
    border: Border.all(style: BorderStyle.none),
    headerStyle: TextStyle(
      color: Theme.of(context).textTheme.bodyMedium!.color,
      fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      fontSize: FS.p6,
    ),
    suffixIcon: const SizedBox.shrink(),
  );
}

CustomDropdownDecoration customDropdownDecoration(
  BuildContext context, {
  bool filled = false,
  Widget? suffixIcon,

}) {
  final boxDecoration = boxDecorationWiththemedBorder(
    context: context,
    filled: filled,
  );
  return CustomDropdownDecoration(
    closedShadow: [],
    expandedShadow: [
      const BoxShadow(
        color: Colors.black38,
        blurRadius: 2,
        blurStyle: BlurStyle.outer,
        spreadRadius: 0,
        offset: Offset(1, 1),
      ),
    ],
    closedFillColor: filled ? boxDecoration.color : Theme.of(context).cardColor,
    closedBorder: boxDecoration.border,
    listItemDecoration: ListItemDecoration(
      selectedColor: Theme.of(context).primaryColor.withAlpha(50),
      splashColor: Theme.of(context).primaryColor.withAlpha(150),
      highlightColor: Theme.of(context).primaryColor.withAlpha(50),
      selectedIconColor: Theme.of(context).textTheme.bodyMedium!.color,
    ),
    closedSuffixIcon: suffixIcon ?? Icon(
      Icons.arrow_drop_down_sharp,
      color: filled ? Theme.of(context).textTheme.bodyMedium!.color : Theme.of(context).primaryColor.withAlpha(150),
      size: FS.p4,
    ),
    expandedFillColor:
        filled ? boxDecoration.color : Theme.of(context).cardColor,
    closedErrorBorder: Border.all(style: BorderStyle.none),
    expandedBorder: Border.all(style: BorderStyle.none),
    expandedSuffixIcon: Icon(
      Icons.arrow_drop_down,
      color: Theme.of(context).textTheme.bodyMedium!.color,
    ),
    headerStyle: TextStyle(
      color: Theme.of(context).textTheme.bodyMedium!.color,
      fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      fontSize: FS.p6,
    ),
    hintStyle: TextStyle(
      color: Theme.of(context).textTheme.bodyMedium!.color,
      fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      fontSize: FS.p6,
    ),
    errorStyle: TextStyle(
      color: Theme.of(context).textTheme.bodyMedium!.color,
      fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      fontSize: FS.p6,
    ),
    listItemStyle: TextStyle(
      color: Theme.of(context).textTheme.bodyMedium!.color,
      fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      fontSize: FS.p6,
    ),
    noResultFoundStyle: TextStyle(
      color: Theme.of(context).textTheme.bodyMedium!.color,
      fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      fontSize: FS.p6,
    ),
  );
}
