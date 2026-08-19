import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/bloc_observerr.dart';
import 'package:pro_todo/core/dependance_injection/di.dart';
import 'package:pro_todo/core/routing/app_router.dart';
import 'package:pro_todo/todo_dev.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependanceInjection();
  Bloc.observer = BlocObserverr();
  runApp(MyApp(appRouter: AppRouter()));
}
