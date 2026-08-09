import 'package:flutter/material.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/login_screen.dart';
import 'package:pro_todo/feature/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:pro_todo/feature/screens/auth/splash_screen/splash_screen.dart';

class AppRouter {
  Route appRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
