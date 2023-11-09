import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:seequl/models/comment_model.dart';
import 'package:seequl/presentation/components/elementary_components/comment_box.dart';

class CommentModal extends StatefulWidget {
  const CommentModal(
      {super.key,
      required this.comments,
      required this.userProfileUrl,
      required this.name,
      required this.username});

  final List<CommentModel> comments;
  final String name;
  final String username;
  final String userProfileUrl;

  @override
  State<CommentModal> createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  bool _showEmojiKeyboard = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<CommentModel> postComments = widget.comments;

    return WillPopScope(
      onWillPop: () {
        if (_showEmojiKeyboard) {
          setState(() {
            _showEmojiKeyboard = !_showEmojiKeyboard;
          });
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: const BoxDecoration(
                    color: Color(0xff5F6368),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Text(
                  '${postComments.length.toString()} Comments',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: postComments.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: CommentBox(
                      name: widget.name,
                      username: widget.username,
                      userProfileUrl: widget.userProfileUrl,
                      comment: postComments[index]),
                ),
              ),
            ),
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
                    child: getCommentInput(context, postComments),
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
    );
  }

  TextField getCommentInput(
      BuildContext context, List<CommentModel> postComments) {
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
          'Add comment',
          style: TextStyle(color: Color(0xff5F6368)),
        ),
        suffixIcon: IconButton(
            icon: const Icon(
              Icons.send,
              color: Color(0xff5C8DFF),
            ),
            onPressed: () {
              setState(() {
                postComments.add(CommentModel(
                    comment: _textEditingController.text,
                    commentorProfileUrl: widget.userProfileUrl,
                    commentorUsername: widget.username,
                    commentorName: widget.name,
                    noLikes: 0,
                    noShares: 0,
                    replies: []));
                _showEmojiKeyboard = false;
              });
              _textEditingController.text = "";
              FocusScope.of(context).unfocus();
            }),
      ),
    );
  }
}
