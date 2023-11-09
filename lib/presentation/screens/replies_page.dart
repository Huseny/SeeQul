import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:seequl/models/comment_model.dart';
import 'package:seequl/models/reply_model.dart';
import 'package:seequl/presentation/components/post_components/custom_appbar.dart';
import 'package:seequl/presentation/components/post_components/repliable_comments.dart';
import 'package:seequl/presentation/components/post_components/reply_box.dart';

class RepliesPage extends StatefulWidget {
  final CommentModel comment;
  final String username;
  final String name;
  final String userProfileUrl;
  const RepliesPage(
      {super.key,
      required this.comment,
      required this.username,
      required this.name,
      required this.userProfileUrl});

  @override
  State<RepliesPage> createState() => _RepliesPageState();
}

class _RepliesPageState extends State<RepliesPage> {
  bool _showEmojiKeyboard = false;
  final TextEditingController _textEditingController = TextEditingController();
  Reply? reply;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_showEmojiKeyboard) {
          setState(() {
            _showEmojiKeyboard = false;
          });
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(name: "SeeQul"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left,
                      size: 25,
                    ),
                  ),
                  const Text(
                    "Reply",
                    style: TextStyle(color: Color(0xff4B4B4B), fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CircleAvatar(
                    foregroundImage:
                        AssetImage(widget.comment.commentorProfileUrl),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReplieableComment(comment: widget.comment),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        ReplyBox(
                          name: widget.name,
                          username: widget.username,
                          userProfileUrl: widget.userProfileUrl,
                          reply: Reply(
                              replierUsername: widget.username,
                              replierName: widget.name,
                              reply: "Whatever man",
                              noLikes: "0",
                              noShares: "0"),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Replying to ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.comment.commentorName} @${widget.comment.commentorUsername}",
                          style: const TextStyle(color: Color(0xffffbb00)),
                        )
                      ],
                    ),
                  ],
                )
              ]),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 8.0,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage(widget.userProfileUrl),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    Expanded(
                      child: getInput(context, reply),
                    ),
                  ],
                ),
              ),
              if (_showEmojiKeyboard)
                SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  child: EmojiPicker(
                    textEditingController: _textEditingController,
                    config: Config(
                        columns: 7,
                        emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0)),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  TextField getInput(BuildContext context, Reply? reply) {
    return TextField(
      controller: _textEditingController,
      onTap: () {
        if (_showEmojiKeyboard) {
          setState(() {
            _showEmojiKeyboard = !_showEmojiKeyboard;
          });
        }
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        alignLabelWithHint: true,
        prefixIcon: IconButton(
          onPressed: () async {
            FocusScope.of(context).unfocus();
            await Future.delayed(const Duration(milliseconds: 250));
            setState(() {
              _showEmojiKeyboard = !_showEmojiKeyboard;
            });
          },
          icon: const Icon(
            Icons.emoji_emotions_outlined,
            color: Color(0xff5F6368),
            size: 35,
          ),
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffC4C4C4)),
            borderRadius: BorderRadius.circular(25)),
        label: const Text(
          'Add reply',
          style: TextStyle(color: Color(0xff5F6368)),
        ),
        suffixIcon: IconButton(
            icon: const Icon(
              Icons.send,
              color: Color(0xff5C8DFF),
            ),
            onPressed: () {
              setState(() {
                reply = Reply(
                    replierUsername: widget.username,
                    replierName: widget.name,
                    reply: _textEditingController.text,
                    noLikes: "0",
                    noShares: "0");
                _showEmojiKeyboard = false;
              });
              _textEditingController.text = "";
              FocusScope.of(context).unfocus();
            }),
      ),
    );
  }
}
