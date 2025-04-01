import 'package:client/bloc/bloc.dart';
import 'package:client/data/entities/title/title.dart';
import 'package:flutter/material.dart' hide Title;

import '../../ui/theme/constants.dart';

class MyLabel extends StatelessWidget {
  const MyLabel({
    required this.text,
    this.onPressed,
    this.size,
    this.fontWeight,
    this.fontStyle,
    this.color,
    this.textOverflow,
    this.decorationStyle,
    this.align,
    this.maxLines,
    this.fontFamily,
    super.key,
  });

  final Object text;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;
  final TextAlign? align;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? decorationStyle;
  final int? maxLines;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    String? _text = '';
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      bloc: localizationBloc,
      builder: (context, state) {
        if (text is Title) {
          _text = localizationBloc.tr(text as Title);
        }

       if (text is String) {
          _text = text as String?;
        }

        return Text(
          _text ?? '',
          textAlign: align,
          maxLines: maxLines,
          style: TextStyle(
            fontWeight: fontWeight ?? FontWeight.w500,
            decoration: decorationStyle,
            overflow: textOverflow,
            fontSize: size,
            color: color,
            decorationColor: color,
            fontStyle: fontStyle,
            fontFamily: fontFamily ?? FontFamilies.roboto,
          ),
        );
      },
    );
  }
}

class HyperLink extends StatelessWidget {
  const HyperLink(this.text, {required this.onClick, this.size, super.key});

  final String text;
  final double? size;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onClick,
      child: MyLabel(
        text: text,
        decorationStyle: TextDecoration.underline,
        color: onClick != null ? Colors.blue : Colors.grey,
        textOverflow: TextOverflow.clip,
        size: size ?? FS.p7,
      ),
    );
  }
}

class FieldRequiredSign extends StatelessWidget {
  const FieldRequiredSign({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: MyLabel(text: '*', color: Colors.red),
    );
  }
}
