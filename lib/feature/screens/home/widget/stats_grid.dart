import 'package:flutter/material.dart';
import 'package:pro_todo/feature/screens/home/widget/stat_card.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 1.4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        StatCard(
          icon: Icons.assignment_outlined,
          iconBgColor: Color(0xFFD4A017),
          label: 'TASKS LEFT',
          value: '12',
        ),
        StatCard(
          icon: Icons.check_circle_outline,
          iconBgColor: Color(0xFF3E4E3E),
          label: 'COMPLETED',
          value: '45',
        ),
      ],
    );
  }
}
