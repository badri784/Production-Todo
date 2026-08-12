import 'package:flutter/material.dart';
import 'package:pro_todo/core/routing/app_router.dart';
import 'package:pro_todo/core/routing/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.appRouter,
      initialRoute: Routes.homeRoute,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
