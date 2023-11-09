import 'package:flutter/material.dart';
import 'package:seequl/presentation/components/elementary_components/show_more_button.dart';

class CustomCaptionBox extends StatefulWidget {
  const CustomCaptionBox({
    Key? key,
    required this.username,
    required this.caption,
  }) : super(key: key);

  final String username;
  final String caption;

  @override
  State<CustomCaptionBox> createState() => _CustomCaptionBoxState();
}

class _CustomCaptionBoxState extends State<CustomCaptionBox> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.8;

    return Container(
      alignment: const Alignment(-1, 1),
      padding: const EdgeInsets.all(20.0),
      width: containerWidth,
      height: expanded ? MediaQuery.of(context).size.height * 0.75 : null,
      decoration: BoxDecoration(
        color: const Color(0xff4c4243).withOpacity(0.66),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFC4C4C4),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (expanded && widget.caption.length > 150)
              GestureDetector(
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: Row(children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  ShowMoreButton(expanded: expanded)
                ]),
              ),
            Text(
              expanded ? widget.caption : _getDisplayCaption(),
              style: const TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "27 Oct. 2020 @5:23pm",
                  style: TextStyle(color: Color(0xffE5A5A5)),
                ),
                if (widget.caption.length > 150 && !expanded)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    child: ShowMoreButton(expanded: expanded),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getDisplayCaption() {
    return widget.caption.length <= 150
        ? widget.caption
        : "${widget.caption.substring(0, 150)}...";
  }
}
