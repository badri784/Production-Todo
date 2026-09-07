import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/bloc_observerr.dart';
import 'package:pro_todo/core/dependance_injection/di.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:pro_todo/core/routing/app_router.dart';
import 'package:pro_todo/todo_dev.dart';
import 'firebase_options.dart';
import 'package:pro_todo/core/model/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<TaskModel>('task');
  await Hive.openBox<NoteModel>('note');
  await setupDependanceInjection();
  Bloc.observer = BlocObserverr();
  runApp(MyApp(appRouter: AppRouter()));
}

