import 'package:queen_validators/queen_validators.dart';

import 'package:flutter/material.dart';

class TextFieldOptions {
  TextFieldOptions({
    this.rules = const [],
  });

  final TextEditingController _controller = TextEditingController();
  final GlobalObjectKey<FormFieldState> _formKey = GlobalObjectKey<FormFieldState>(UniqueKey());

  TextEditingController get controller => _controller;
  GlobalObjectKey<FormFieldState> get formKey => _formKey;
  final List<TextValidationRule> rules;
}
