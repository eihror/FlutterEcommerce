import 'package:ecommerce_flutter/feature/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:ecommerce_flutter/navigation/app_route.dart';
import 'package:go_router/go_router.dart';

class SignInRoute extends AppRoute {
  SignInRoute() : super(path: '/sign-in');
}

final List<RouteBase> authenticationRoutes = [
  GoRoute(
    path: SignInRoute().path,
    builder: (context, state) => const SignInScreen(),
  ),
];
