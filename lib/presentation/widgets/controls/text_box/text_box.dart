import 'package:client/global.dart';
import 'package:client/presentation/ui/theme/constants.dart';
import 'package:client/presentation/ui/theme/text.dart';
import 'package:client/presentation/widgets/context.dart';
import 'package:client/presentation/widgets/controls/control_box_decoration.dart';
import 'package:client/presentation/widgets/controls/field_label.dart';
import 'package:client/presentation/widgets/controls/text.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
export 'controller.dart';

import 'package:client/presentation/widgets/controls/text_box/controller.dart';
export 'package:queen_validators/queen_validators.dart';
export 'package:client/core/helpers/validate/validators.dart';

class MyTextBox extends StatefulWidget {
  const MyTextBox({
    super.key,
    this.label,
    this.hintText,
    this.enabled,
    this.onSubmitted,
    this.filled = false,
    this.fillColor,
    this.obscureText = false,
    this.width,
    this.horizontalMargin,
    this.verticalMargin,
    this.verticalPadding,
    this.options,
    this.onFail,
  });

  final String? label;
  final String? hintText;
  final bool? enabled;
  final Function(String)? onSubmitted;
  final bool filled;
  final Color? fillColor;
  final bool obscureText;
  final double? width;
  final double? horizontalMargin;
  final double? verticalMargin;
  final double? verticalPadding;
  final TextFieldOptions? options;
  final OnFailureCallBack? onFail;

  @override
  State<MyTextBox> createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  late bool _obscureText;
  String errorText = '';

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: widget.width,
        margin: EdgeInsets.symmetric(
          horizontal: widget.horizontalMargin ?? 0,
          vertical: widget.verticalMargin ?? 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) FieldLabel(label: widget.label!),
            if (widget.label != null) SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: widget.verticalPadding ?? 3,
              ),
              decoration: boxDecorationWiththemedBorder(
                filled: widget.filled,
                context: context,
              ),
              child: TextFormField(
                key: widget.options?.formKey,
                controller: widget.options?.controller,
                onChanged: (value) {
                  setState(() {
                    errorText = '';
                  });
                },
                validator: (value) {
                  if (widget.options?.rules != null) {
                    qValidator(
                      widget.options!.rules,
                      onFail: (input, rules, failedRule) {
                        if (widget.onFail != null) {
                          setState(() {
                            errorText = failedRule.error ?? '';
                          });
                          widget.onFail!(input, rules, failedRule);
                        }
                      },
                    )(value);
                  }
                  return null;
                },
                onFieldSubmitted: widget.onSubmitted,
                textAlignVertical: TextAlignVertical.center,
                obscureText: _obscureText,
                obscuringCharacter: '•',
                maxLines: 1,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintMaxLines: 1,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                    fontSize: FS.p7,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero,
                  constraints: BoxConstraints(maxHeight: 30),
                  suffixIcon:
                      widget.obscureText
                          ? IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: FS.p6,

                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )
                          : null,
                ),
              ),
            ),
            if (errorText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: MyLabel(
                  text: errorText,
                  align: TextAlign.start,
                  size: Theme.of(context).textTheme.bodyMedium!.fontSize! * 0.9,
                  color:
                      context.isDarkMode()
                          ? AppTheme.textErrorColorDark
                          : AppTheme.textErrorColorLight,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
