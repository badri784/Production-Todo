import 'package:flutter/material.dart';
import 'package:pro_todo/feature/screens/home/widget/home_app_bar.dart';
import 'package:pro_todo/feature/screens/home/widget/stats_grid.dart';
import 'package:pro_todo/feature/screens/home/widget/view_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [StatsGrid(), SizedBox(height: 20), ViewAllText()],
        ),
      ),
    );
  }
}
