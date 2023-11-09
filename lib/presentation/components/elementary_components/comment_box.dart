import 'package:flutter/material.dart';
import 'package:seequl/models/comment_model.dart';
import 'package:seequl/presentation/components/elementary_components/custom_button.dart';
import 'package:seequl/presentation/screens/replies_page.dart';

class CommentBox extends StatelessWidget {
  const CommentBox(
      {super.key,
      required this.comment,
      required this.name,
      required this.username,
      required this.userProfileUrl});

  final CommentModel comment;
  final String name;
  final String username;
  final String userProfileUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CircleAvatar(
              foregroundImage: AssetImage(comment.commentorProfileUrl),
            ),
          ),
          Column(
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  MyButton(
                    isColumn: false,
                    color: const Color(0xffC4C4C4),
                    number: comment.replies.length.toString(),
                    icon: Icons.comment_outlined,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, an) => RepliesPage(
                                    name: name,
                                    username: username,
                                    userProfileUrl: userProfileUrl,
                                    comment: comment,
                                  )));
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MyButton(
                    isColumn: false,
                    color: const Color(0xffC4C4C4),
                    icon: Icons.favorite_outline,
                    number: comment.noLikes.toString(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const MyButton(
                    isColumn: false,
                    color: Color(0xffC4C4C4),
                    icon: Icons.flag_outlined,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, an) => RepliesPage(
                                  name: name,
                                  username: username,
                                  userProfileUrl: userProfileUrl,
                                  comment: comment,
                                )));
                  },
                  child: Row(
                    children: [
                      Text(
                        "View ${comment.replies.length.toString()} replies ",
                        style: const TextStyle(color: Color(0xff959595)),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xff959595),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
