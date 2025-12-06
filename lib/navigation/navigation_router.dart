import 'package:ecommerce_flutter/feature/authentication/presentation/navigation/authentication_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final routeObserver = RouteObserver<PageRoute<dynamic>>();

final navigationRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: SignInRoute().path,
  debugLogDiagnostics: kDebugMode,
  observers: [routeObserver],
  redirect: (context, state) {},
  routes: [
    ...authenticationRoutes,
  ],
);
