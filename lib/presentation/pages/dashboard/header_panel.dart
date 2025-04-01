import 'package:client/bloc/bloc.dart';
import 'package:client/global.dart';
import 'package:client/presentation/ui/theme/switcher.dart';
import 'package:flutter/foundation.dart';
import 'package:client/presentation/widgets.dart';

import 'routes.dart';

class HeaderPanel extends StatelessWidget {
  const HeaderPanel({
    super.key,
    required this.pageIndex,
    required this.sideBarWidth,
  });

  final int pageIndex;
  final double sideBarWidth;

  @override
  Widget build(BuildContext context) {
    final bgColor1 =
        context.isDarkMode()
            ? Color.fromRGBO(60, 72, 72, 1.0)
            : Color.fromRGBO(213, 240, 245, 1.0);
    final bgColor2 =
        context.isDarkMode()
            ? Color.fromRGBO(37, 51, 51, 1.0)
            : Color.fromRGBO(45, 65, 61, 1.0);
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              height: 60,
              width: sideBarWidth,
              color: bgColor2,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.ac_unit_rounded,
                    color: Colors.greenAccent,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: MyLabel(
                      text: 'appTitle'.i18n(),
                      textOverflow: TextOverflow.visible,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 60,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    MyLabel(text: routeTitles[pageIndex].i18n(), size: FS.p6),
                    if (kDebugMode) ...[
                      const SizedBox(width: 10),
                      BlocBuilder<RouterBloc, RouterState>(
                        bloc: routerBloc,
                        builder: (context, routerState) {
                          return MyLabel(
                            text: 'Route: ${routerState.route}',
                            size: FS.p6,
                          );
                        },
                      ),
                    ],
                    Expanded(child: SizedBox(width: 20)),
                    ThemeSwitcher(
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person, size: 24),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
