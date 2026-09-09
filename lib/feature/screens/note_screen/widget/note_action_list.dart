import 'package:flutter/material.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/list_tile_widget.dart';

class NoteActionList extends StatelessWidget {
  const NoteActionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(
          onTap: () {},
          leading: const Icon(Icons.edit_note, size: 20),
          title: const Text('Edit Note'),
          subtitle: const Text(
            'Make updates to content & tags',
            style: TextStyle(fontSize: 12),
          ),
          trail: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTileWidget(
          onTap: () {},
          color: const Color(0XFFe9efe9),
          leading: const Icon(Icons.push_pin, size: 20),
          title: const Text('Organize & Pin'),
          subtitle: const Text(
            'Manage tags, notebooks, or pin to top',
            style: TextStyle(fontSize: 12),
          ),
          trail: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTileWidget(
          onTap: () {},
          color: const Color(0XFFe9efe9),
          leading: const Icon(Icons.ios_share, size: 20),
          title: const Text('Share Note'),
          subtitle: const Text(
            'Export PDF, markdown or share link',
            style: TextStyle(fontSize: 12),
          ),
          trail: const Icon(Icons.keyboard_arrow_right),
        ),
        const Divider(color: Color(0xffebefea)),
        ListTileWidget(
          onTap: () {},
          color: const Color(0xffffdad6),
          title: const Text('Delete Note'),
          leading: const Icon(Icons.delete, size: 20, color: Colors.red),
          subtitle: const Text(
            'Move to trash or permanently remove',
            style: TextStyle(fontSize: 12),
          ),
          trail: const Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }
}
