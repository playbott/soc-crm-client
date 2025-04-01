import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../ui/theme/constants.dart';
import 'button.dart';
import 'text.dart';

Future<void> showMyDialogYesNo(
  BuildContext context, {
  required String title,
  required String msg,
  bool? barrierDismissible,
  Widget? image,
  VoidCallback? noAction,
  required VoidCallback yesAction,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible ?? false,
    builder: (BuildContext context) {
      final themeMode = Theme.of(context).brightness;
      final backgroundColor = themeMode == Brightness.light
          ? AppTheme.mainColor
          : AppTheme.lightBlueColor;
      return AlertDialog(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        alignment: Alignment.center,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: MyLabel(
                  text: title,
                  align: TextAlign.center,
                  size: FS.p4,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamilies.comfortaa,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: MyLabel(
                        text: msg,
                        align: TextAlign.center,
                        size: FS.p6,
                      ),
                    ),
                  ),
                ],
              ),
              if (image != null) image,
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: MyButton(
                  minWidth: 80,
                  height: 35,
                  onPressed: () {
                    if (noAction != null) {
                      noAction();
                    }
                    Navigator.of(context).pop();
                  },
                  text: 'no'.i18n(),
                  color: backgroundColor,
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                child: MyButton(
                  minWidth: 80,
                  height: 35,
                  onPressed: () {
                    yesAction();
                    Navigator.of(context).pop();
                  },
                  text: 'yes'.i18n(),
                  color: backgroundColor,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Future<void> showMyDialogOK(
  BuildContext context, {
  required String title,
  bool? barrierDismissible,
  required String msg,
  Widget? image,
  required VoidCallback? okAction,
}) {
  return showDialog<void>(
    barrierDismissible: barrierDismissible ?? false,
    context: context,
    builder: (BuildContext context) {
      final themeMode = Theme.of(context).brightness;
      return AlertDialog(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        alignment: Alignment.center,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: MyLabel(
                  text: title,
                  align: TextAlign.center,
                  size: FS.p4,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamilies.comfortaa,
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: MyLabel(
                        text: msg,
                        align: TextAlign.center,
                        size: FS.p6,
                      ),
                    ),
                  ),
                ],
              ),
              if (image != null) image,
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 35,
                child: MyButton(
                  onPressed: () {
                    if (okAction != null) okAction();
                    Navigator.of(context).pop();
                  },
                  text: 'ok'.i18n(),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
