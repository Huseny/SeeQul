import 'package:flutter/material.dart';
import 'package:seequl/models/comment_model.dart';

class ReplieableComment extends StatelessWidget {
  const ReplieableComment({
    super.key,
    required this.comment,
  });

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(comment.commentorName),
            const SizedBox(
              width: 8,
            ),
            Text(
              "@${comment.commentorUsername}",
              style: const TextStyle(color: Color(0xff5C8DFF)),
            ),
            const SizedBox(
              width: 25,
            ),
            const Text(
              "3 hours ago",
              style: TextStyle(color: Color(0xffC4C4C4)),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            comment.comment,
            overflow: TextOverflow.clip,
            style: const TextStyle(color: Color(0xff767676)),
          ),
        ),
      ],
    );
  }
}
