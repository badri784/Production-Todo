import 'package:flutter/material.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/feature/screens/auth/splash_screen/splash_screen.dart';

class AppRouter {
  Route appRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
