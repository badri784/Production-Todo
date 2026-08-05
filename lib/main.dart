import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pro_todo/todo_dev.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
