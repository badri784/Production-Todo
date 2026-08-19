import 'package:flutter/material.dart';

class FloatingActionBottomWidget extends StatelessWidget {
  const FloatingActionBottomWidget({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: const Color(0xFF234A27),
      child: Icon(icon, color: Colors.white),
    );
  }
}
