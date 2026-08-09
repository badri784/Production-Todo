import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pro_todo/core/routing/app_router.dart';
import 'package:pro_todo/todo_dev.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp(appRouter: AppRouter(),));
}
