import 'package:flutter/material.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: PopupMenuButton(
        icon: const Icon(Icons.menu, size: 30.0, color: Color(0xff1565C0)),
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.add_box_rounded,
                      color: Color.fromRGBO(99, 129, 199, 1),
                    ),
                    SizedBox(width: 12.0),
                    Text('Post a Seequl'),
                  ],
                )),
            const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Color.fromRGBO(251, 94, 94, 1),
                    ),
                    SizedBox(width: 12.0),
                    Text('View your likes'),
                  ],
                )),
            const PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.circle),
                    SizedBox(width: 12.0),
                    Text('Your Seequl posts'),
                  ],
                )),
            const PopupMenuItem(
                value: 4,
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_book_outlined,
                      color: Color.fromRGBO(95, 99, 104, 1),
                    ),
                    SizedBox(width: 12.0),
                    Text('Reference Contribution'),
                  ],
                )),
            const PopupMenuItem(
                value: 5,
                child: Row(
                  children: [
                    Icon(
                      Icons.tag,
                      color: Color.fromRGBO(95, 99, 104, 1),
                    ),
                    SizedBox(width: 12.0),
                    Text('HashTag Challenges'),
                  ],
                )),
            const PopupMenuItem(
                value: 6,
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Color.fromRGBO(42, 81, 24, 1),
                    ),
                    SizedBox(width: 12.0),
                    Text('Notifications'),
                  ],
                )),
            const PopupMenuItem(
                value: 7,
                child: Row(
                  children: [
                    Icon(Icons.info, color: Color.fromRGBO(128, 93, 93, 1)),
                    SizedBox(width: 12.0),
                    Text('About SeeQul'),
                  ],
                )),
          ];
        },
        onSelected: (value) {},
      ),
    );
  }
}
