import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  const CustomAppBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CircleAvatar(
            child: Image.asset("lib/assets/placeholder.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(name),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff959595),
              ))
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              // ignore: avoid_print
              print("Search pressed");
            },
            icon: const Icon(LineAwesomeIcons.search)),
        IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.wired_network))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
