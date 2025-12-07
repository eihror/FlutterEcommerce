import 'package:ecommerce_flutter/feature/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:ecommerce_flutter/feature/authentication/presentation/sign_up/sign_up_screen.dart';
import 'package:ecommerce_flutter/navigation/app_route.dart';
import 'package:go_router/go_router.dart';

class SignInRoute extends AppRoute {
  SignInRoute() : super(path: '/auth/sign-in');
}

class SignUpRoute extends AppRoute {
  SignUpRoute() : super(path: '/auth/sign-up');
}

final List<RouteBase> authenticationRoutes = [
  GoRoute(
    path: SignInRoute().path,
    builder: (context, state) => const SignInScreen(),
  ),
  GoRoute(
    path: SignUpRoute().path,
    builder: (context, state) => const SignUpScreen(),
  ),
];
