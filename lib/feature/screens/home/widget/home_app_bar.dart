import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Hello,'),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
        child: CircleAvatar(
          child: CachedNetworkImage(
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
// https://cdn-icons-png.flaticon.com/512/149/149071.png