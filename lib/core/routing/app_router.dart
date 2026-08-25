import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/login_screen.dart';
import 'package:pro_todo/feature/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:pro_todo/feature/screens/auth/splash_screen/splash_screen.dart';
import 'package:pro_todo/feature/screens/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:pro_todo/feature/screens/home/widget/navigation_bar.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/add_task_screen/add_task_screen.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/cubit/task_cubit.dart';

class AppRouter {
  Route appRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const AppNavigationBar(),
        );
      case Routes.addTaskScreen:
        final taskCubit = routeSettings.arguments as TaskCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: taskCubit,
            child: const AddTaskScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
