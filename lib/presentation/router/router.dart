import 'package:client/bloc/bloc.dart';
import 'package:client/core/helpers/jwt_decoder.dart';
import 'package:client/global.dart';
import 'package:client/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:flutter/foundation.dart';
import 'router_observer.dart';
import 'routes.dart';

final heroAnimationController = MaterialApp.createMaterialHeroController();
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: false,
  initialLocation:
      (isTokenValid(Prefs.getString(accessTokenKey) ?? ''))
          ? '/main'
          : '/sign-in',
  navigatorKey: rootNavigatorKey,
  observers: [GoRouterObserver()],
  routes: <RouteBase>[
    GoRoute(
      path: '/sign-in',
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
    statefulShellRoutes,
  ],
);

SlideTransition makeSlideTransition(
  TransitionType type,
  Animation<double> animation,
  Widget child,
) {
  final Tween<Offset> tween;

  switch (type) {
    case TransitionType.slideLeftToRight:
      tween = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
      break;
    case TransitionType.slideUp:
      tween = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
      break;
    case TransitionType.slideRightToLeft:
      tween = Tween<Offset>(end: const Offset(1.0, 0.0), begin: Offset.zero);
  }

  return SlideTransition(
    position: tween.animate(animation),
    child: HeroControllerScope(
      controller: heroAnimationController,
      child: child,
    ),
  );
}

class TransitionGoRoute extends GoRoute {
  TransitionGoRoute({
    super.routes,
    super.builder,
    this.transitionType,
    required super.path,
  }) : super(
         pageBuilder:
             (context, state) => CustomTransitionPage<void>(
               child: builder!(context, state),
               transitionsBuilder: (
                 context,
                 animation,
                 secondaryAnimation,
                 child,
               ) {
                 return transitionType == null
                     ? FadeTransition(
                       opacity: CurveTween(
                         curve: Curves.easeIn,
                       ).animate(animation),
                       child: child,
                     )
                     : makeSlideTransition(transitionType, animation, child);
               },
             ),
       );

  final TransitionType? transitionType;
}

enum TransitionType { slideLeftToRight, slideRightToLeft, slideUp }

class MyRoute extends GoRoute {
  MyRoute({
    required super.path,
    super.builder,
    super.pageBuilder,
    super.routes,
    super.redirect,
  });

  @override
  GoRouterPageBuilder? get pageBuilder {
    try {
      routerBloc.add(RouterEvent(super.path));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return super.pageBuilder;
  }
}
