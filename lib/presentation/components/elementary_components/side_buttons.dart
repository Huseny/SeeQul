import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:seequl/presentation/components/elementary_components/custom_button.dart';

class PostSideButtons extends StatelessWidget {
  const PostSideButtons(
      {super.key,
      required this.noComments,
      required this.noLikes,
      required this.userProfileUrl,
      required this.commentOnTap});

  final String noComments;
  final String noLikes;
  final String userProfileUrl;

  final void Function() commentOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        alignment: const Alignment(1, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              foregroundImage: AssetImage(userProfileUrl),
            ),
            const SizedBox(
              height: 5,
            ),
            const MyButton(
              icon: LineAwesomeIcons.book_open,
            ),
            const SizedBox(
              height: 5,
            ),
            MyButton(
              icon: LineAwesomeIcons.comment,
              number: noComments,
              onTap: commentOnTap,
            ),
            const SizedBox(
              height: 5,
            ),
            MyButton(
              icon: Icons.favorite,
              number: noLikes,
            ),
            const SizedBox(
              height: 5,
            ),
            const MyButton(
              icon: Icons.share_outlined,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
