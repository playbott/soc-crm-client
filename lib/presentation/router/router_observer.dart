import 'package:flutter/material.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    checkAuth(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    checkAuth(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    checkAuth(newRoute);
  }
}

void checkAuth(Route<dynamic>? newRoute) {
}
