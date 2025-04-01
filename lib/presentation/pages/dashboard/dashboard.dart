import 'package:client/global.dart';
import 'package:client/presentation/widgets.dart';
import 'header_panel.dart';
import 'info_bar_widget.dart';
import 'side_bar_main.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar>
    with SingleTickerProviderStateMixin {
  Widget previousWidget = SizedBox.shrink();

  Key headerListKey = const Key('headerList');

  Future<void> _onTap(BuildContext context, int index) async {
    final routesIndices = [0, 1, 2, 3];
    if (routesIndices.contains(index)) {
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    }
  }

  List<Widget> headerItems({
    required BuildContext context,
    required VoidCallback onTap,
  }) => [];

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode();
    final sideBarColor =
        context.isDarkMode()
            ? Color.fromRGBO(37, 51, 51, 1.0)
            : Color.fromRGBO(45, 65, 61, 1.0);
    var pageIndex = widget.navigationShell.currentIndex;
    final sideBarWidth = 250.0;
    var newwidget = widget.navigationShell;
    return InfoBarWrapper(
      child: Scaffold(
        backgroundColor:
            isDark ? AppTheme.pageColorDark : AppTheme.pageColorLight,
        body: Stack(
          children: [
            Container(width: sideBarWidth, color: sideBarColor),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: HeaderPanel(
                        sideBarWidth: sideBarWidth,
                        pageIndex: pageIndex,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: sideBarWidth,
                        child: SideBarMain(
                          pageIndex: pageIndex,
                          onElementTap: _onTap,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [newwidget],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
