import 'package:flutter/material.dart';
import 'package:pro_todo/feature/screens/auth/splash_screen/widgets/elevated_in_splash_screen.dart';
import 'package:pro_todo/feature/screens/auth/splash_screen/widgets/icon_task_flow.dart';
import 'package:pro_todo/feature/screens/auth/splash_screen/widgets/text_in_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 4),
              IconTaskFlow(),
              TextInSplashScreen(),
              Spacer(),
              ElevatedInSplashScreen(),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
