import 'package:client/global.dart';

class SidebarTheme extends StatelessWidget {
  const SidebarTheme({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        expansionTileTheme: ExpansionTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
          collapsedIconColor: Colors.white,
          collapsedTextColor: Colors.white,
          shape: Border.symmetric(
            horizontal: BorderSide.none,
            vertical: BorderSide.none,
          ),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
          selectedTileColor: Colors.red.withAlpha(200),
          selectedColor: Colors.red.withAlpha(200),
          tileColor: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.white),
          leadingAndTrailingTextStyle: TextStyle(color: Colors.white),
          subtitleTextStyle: TextStyle(color: Colors.white),
          shape: Border.all(color: Colors.transparent),
        ),
      ),
      child: child,
    );
  }
}
