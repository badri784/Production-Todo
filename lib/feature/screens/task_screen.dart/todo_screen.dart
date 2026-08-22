import 'package:flutter/material.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/routing/routes.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushnamed(Routes.addTaskScreen);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Todo Screen title')),
      body: const Center(child: Text('Todo Screen body')),
    );
  }
}
