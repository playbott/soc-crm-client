import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:client/presentation/ui/theme/constants.dart';

class LightThemeConst {
  static final lightTheme = ThemeData.light().copyWith(
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: AppTheme.lightBlueColor,
      indicatorColor: AppTheme.mainColor,
      dividerColor: AppTheme.mainColor.withOpacity(0.2),
      labelColor: AppTheme.mainColor,
    ),
    textTheme: TextTheme(bodyMedium: TextStyle(fontFamily: FontFamilies.roboto, color: Colors.black)),
    cardTheme: CardTheme(color: AppTheme.cardColorLight),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppTheme.mainColor,
      selectionColor: AppTheme.selectioncolor,
      selectionHandleColor: AppTheme.mainColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      focusColor: AppTheme.mainColor,
      hoverColor: AppTheme.mainColor,
      iconColor: AppTheme.mainColor,
      prefixIconColor: AppTheme.textColorLight,
      suffixIconColor: AppTheme.mainColor,
      prefixStyle: TextStyle(color: AppTheme.textColorLight),
      hintStyle: TextStyle(color: AppTheme.mainColor),
      labelStyle: TextStyle(color: AppTheme.mainColor),
      floatingLabelStyle: TextStyle(color: AppTheme.mainColor),
    ),
    primaryColorLight: AppTheme.mainColor,
    primaryColorDark: AppTheme.mainColor,
    primaryColor: AppTheme.mainColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppTheme.mainColor,
    ),
    focusColor: AppTheme.greyColor1,
    highlightColor: AppTheme.whiteColor.withOpacity(0.5),
    drawerTheme: const DrawerThemeData(backgroundColor: AppTheme.whiteColor),
    dividerColor: AppTheme.blackColor,
    scaffoldBackgroundColor: AppTheme.whiteColor,
    cardColor: AppTheme.cardColorLight,
    hintColor: AppTheme.greyColor,
    dropdownMenuTheme: const DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
        surfaceTintColor: WidgetStatePropertyAll<Color>(Colors.white),
      ),
    ),
    dividerTheme: DividerThemeData(color: AppTheme.mainColor.withOpacity(0.2)),
    bottomSheetTheme: const BottomSheetThemeData(
      shadowColor: AppTheme.whiteColor,
      surfaceTintColor: AppTheme.whiteColor,
      backgroundColor: AppTheme.whiteColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppTheme.whiteColor,
      unselectedItemColor: AppTheme.textColorLight,
      selectedItemColor: AppTheme.mainColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.appBarLight,
      foregroundColor: AppTheme.appBarDark,
      surfaceTintColor: AppTheme.whiteColor,
      toolbarTextStyle:
          const TextTheme(
            displayLarge: TextStyle(color: AppTheme.darkBlue),
          ).displayLarge,
      titleTextStyle:
          const TextTheme(
            displayLarge: TextStyle(color: AppTheme.darkBlue),
          ).displayLarge,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(AppTheme.mainColor),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    iconTheme: const IconThemeData(color: AppTheme.mainColor),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppTheme.greyColor1,
      surfaceTintColor: AppTheme.greyColor1,
    ),
    canvasColor: AppTheme.darkBlue,
    colorScheme: const ColorScheme.light(
      background: AppTheme.greyColor1,
      onBackground: AppTheme.greyColor1,
    ).copyWith(background: AppTheme.blackColor),
    dialogTheme: DialogThemeData(
      backgroundColor: AppTheme.cardColorLight,
      surfaceTintColor: AppTheme.surfaceTintColor,
    ),
  );
}
