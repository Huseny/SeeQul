import 'package:flutter/material.dart';

class ShowMoreButton extends StatelessWidget {
  final bool expanded;
  const ShowMoreButton({super.key, required this.expanded});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(44, 43, 43, 0.80),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            expanded ? "...Less " : "...More ",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          Icon(
            expanded
                ? Icons.arrow_circle_down_sharp
                : Icons.arrow_circle_up_sharp,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }
}
