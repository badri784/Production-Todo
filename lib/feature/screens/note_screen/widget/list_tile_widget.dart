import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.trail,
    this.subtitle,
    this.title,
    this.leading,
    this.color,
    this.onTap,
  });
  final Widget? title;
  final Widget? subtitle;
  final Widget? trail;
  final Widget? leading;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: title,
      subtitle: subtitle,
      trailing: trail,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color ?? const Color(0xffc1eebe),
          borderRadius: BorderRadius.circular(10),
        ),
        child: leading,
      ),
    );
  }
}
