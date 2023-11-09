import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final IconData? icon;
  final String? number;
  final Color? color;
  final bool isColumn;

  final void Function()? onTap;

  const MyButton(
      {super.key,
      this.icon,
      this.number,
      this.onTap,
      this.color,
      this.isColumn = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? onTap,
      child: isColumn == true
          ? Column(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: color ?? Colors.white,
                ),
                Text(
                  number != null ? number! : "",
                  style: TextStyle(color: color ?? Colors.white),
                ),
              ],
            )
          : Row(children: [
              Icon(
                icon,
                size: 30,
                color: color ?? Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                number != null ? number! : "",
                style: TextStyle(color: color ?? Colors.white),
              ),
            ]),
    );
  }
}
