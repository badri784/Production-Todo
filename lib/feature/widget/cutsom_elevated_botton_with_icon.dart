import 'package:flutter/material.dart';

class CutsomElevatedBottonWithIcon extends StatelessWidget {
  const CutsomElevatedBottonWithIcon({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8,
    this.customTextStyle,
    this.border,
    required this.iconWidget,
  });
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle? customTextStyle;
  final BorderSide? border;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: border,
      ),
      icon: iconWidget,
      label: Text(text, style: customTextStyle),
    );
  }
}
