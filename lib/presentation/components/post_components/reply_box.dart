import 'package:flutter/material.dart';
import 'package:seequl/models/reply_model.dart';
import 'package:seequl/presentation/components/elementary_components/custom_button.dart';

class ReplyBox extends StatelessWidget {
  const ReplyBox(
      {super.key,
      required this.reply,
      required this.name,
      required this.username,
      required this.userProfileUrl});

  final Reply reply;
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
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              foregroundImage: AssetImage(userProfileUrl),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(reply.replierName),
                  const SizedBox(
                    width: 1,
                  ),
                  Text(
                    "@${reply.replierUsername}",
                    style: const TextStyle(color: Color(0xff5C8DFF)),
                  ),
                  const SizedBox(
                    width: 5,
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
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  reply.reply,
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
                    icon: Icons.favorite_outline,
                    number: reply.noLikes.toString(),
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
            ],
          )
        ],
      ),
    );
  }
}
