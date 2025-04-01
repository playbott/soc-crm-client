import 'package:flutter/material.dart';
import 'package:client/presentation/ui/theme/constants.dart';

class DarkThemeConst {
  static final darkTheme = ThemeData.dark().copyWith(
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: AppTheme.greyColor,
      indicatorColor: AppTheme.mainColorDark,
      dividerColor: AppTheme.mainColorDark.withOpacity(0.2),
      labelColor: AppTheme.mainColorDark,
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: FontFamilies.roboto,
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(color: AppTheme.cardColorDark),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppTheme.mainColorDark,
      selectionColor: AppTheme.selectioncolorDark,
      selectionHandleColor: AppTheme.mainColorDark,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color.fromARGB(255, 70, 69, 69),
      focusColor: AppTheme.mainColorDark,
      hoverColor: AppTheme.mainColorDark,
      iconColor: AppTheme.mainColorDark,
      prefixIconColor: AppTheme.textColorLight,
      suffixIconColor: AppTheme.mainColorDark,
      prefixStyle: TextStyle(color: AppTheme.textColorDark),
      hintStyle: TextStyle(color: AppTheme.mainColorDark),
      labelStyle: TextStyle(color: AppTheme.mainColorDark),
      floatingLabelStyle: TextStyle(color: AppTheme.mainColorDark),
    ),
    primaryColorLight: AppTheme.mainColor,
    primaryColorDark: AppTheme.mainColor,
    primaryColor: AppTheme.mainColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppTheme.mainColorDark,
    ),
    dialogBackgroundColor: AppTheme.blackColor,
    highlightColor: AppTheme.blackColor.withOpacity(0.5),
    focusColor: AppTheme.mainColorDark.withOpacity(0.6),
    dividerColor: AppTheme.whiteColor,
    hintColor: Colors.white.withOpacity(.5),
    dividerTheme: DividerThemeData(
      color: AppTheme.mainColorDark.withOpacity(0.2),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shadowColor: AppTheme.greyColor,
      surfaceTintColor: AppTheme.greyColor,
      backgroundColor: AppTheme.greyColor,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: AppTheme.darkColor),
    scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColorDark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(58, 58, 58, 1),
      unselectedItemColor: Colors.white,
      selectedItemColor: AppTheme.mainColor,
    ),
    cardColor: AppTheme.cardColorDark,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(AppTheme.mainColor),
      ),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: const Color.fromARGB(255, 253, 253, 253),
      surfaceTintColor: const Color.fromARGB(255, 24, 29, 34),
      backgroundColor: AppTheme.appBarDark,
      toolbarTextStyle:
          const TextTheme(
            displayLarge: TextStyle(color: AppTheme.whiteColor),
          ).displayLarge,
      titleTextStyle:
          const TextTheme(
            displayLarge: TextStyle(color: AppTheme.whiteColor),
          ).displayLarge,
    ),
    iconTheme: const IconThemeData(color: AppTheme.whiteColor),
    canvasColor: AppTheme.whiteColor,
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppTheme.mainColorDark,
      todayBackgroundColor: WidgetStatePropertyAll(AppTheme.whiteColor),
    ),
    colorScheme: ColorScheme.dark(
      background: AppTheme.greyColor1,
      onBackground: AppTheme.darkColor,
    ).copyWith(background: AppTheme.whiteColor),
    dialogTheme: DialogThemeData(
      titleTextStyle: TextStyle(color: AppTheme.whiteColor, fontSize: FS.p5),
      contentTextStyle: TextStyle(color: AppTheme.whiteColor, fontSize: FS.p7),
      backgroundColor: AppTheme.cardColorDark,
      surfaceTintColor: AppTheme.surfaceTintColor,
    ),
  );
}
