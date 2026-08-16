import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Hello,'),
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
        const SizedBox(width: 10),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
