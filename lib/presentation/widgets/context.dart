import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool isDarkMode() {
    return Theme.of(this).brightness == Brightness.dark;
  }

  bool isLightMode() {
    return Theme.of(this).brightness == Brightness.light;
  }

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
