import 'package:ecommerce_flutter/feature/home/presentation/home_screen.dart';
import 'package:ecommerce_flutter/navigation/app_route.dart';
import 'package:go_router/go_router.dart';

class HomeRoute extends AppRoute {
  HomeRoute() : super(path: '/home');
}

final List<RouteBase> homeRoutes = [
  GoRoute(
    path: HomeRoute().path,
    builder: (context, state) => const HomeScreen(),
  ),
];
