import 'package:client/global.dart';
import 'package:client/presentation/pages/dashboard/dashboard.dart';
import 'package:client/presentation/pages/users/users_page.dart';
import 'package:client/presentation/router/router.dart';
import 'package:client/presentation/widgets/controls/text.dart';

final statefulShellRoutes = StatefulShellRoute.indexedStack(
  builder: (
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell child,
  ) {
    return ScaffoldWithNavBar(navigationShell: child);
  },
  branches: <StatefulShellBranch>[
    StatefulShellBranch(
      routes: <RouteBase>[
        MyRoute(
          path: '/main',
          builder: (context, state) {
            return Align(
              alignment: Alignment.center,
              child: MyLabel(text: 'main'.i18n(), size: 30),
            );
          },
          routes: const [],
        ),
      ],
    ),
    StatefulShellBranch(
      preload: false,
      routes: <RouteBase>[
        MyRoute(
          path: '/users',
          builder: (context, state) {
            return UsersPage();
          },
          routes: const [],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: <RouteBase>[
        MyRoute(
          path: '/artists',
          builder: (context, state) {
            return Align(
              alignment: Alignment.center,
              child: MyLabel(text: 'artists'.i18n(), size: 30),
            );
          },
          routes: const [],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: <RouteBase>[
        MyRoute(
          path: '/sessions',
          builder: (context, state) {
            return Container();
          },
          routes: const [],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: <RouteBase>[
        MyRoute(
          path: '/albums',
          builder: (context, state) {
            return Container();
          },
          routes: const [],
        ),
      ],
    ),
  ],
);
