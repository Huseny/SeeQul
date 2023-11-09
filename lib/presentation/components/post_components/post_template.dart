import 'package:flutter/material.dart';
import 'package:seequl/models/comment_model.dart';
import 'package:seequl/models/post_model.dart';
import 'package:seequl/presentation/components/elementary_components/custom_popup.dart';
import 'package:seequl/presentation/components/post_components/comment_modal.dart';
import 'package:seequl/presentation/components/post_components/custom_caption_box.dart';
import 'package:seequl/presentation/components/elementary_components/hide_icon.dart';
import 'package:seequl/presentation/components/elementary_components/side_buttons.dart';

class PostTemplate extends StatefulWidget {
  final Post post;
  final void Function()? onHide;

  const PostTemplate({
    super.key,
    required this.post,
    required this.onHide,
  });

  @override
  State<PostTemplate> createState() => _PostTemplateState();
}

class _PostTemplateState extends State<PostTemplate> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.post.postImageUrl,
              fit: BoxFit.cover,
            ),
          ),

          isHidden != true
              ? const Positioned(
                  top: 8.0,
                  left: 16.0,
                  child: CustomPopUpMenu(),
                )
              : Container(),

          isHidden != true
              ? Positioned(
                  left: 10,
                  bottom: 5,
                  child: CustomCaptionBox(
                    username: widget.post.username,
                    caption: widget.post.caption,
                  ),
                )
              : Container(),

          // buttons
          isHidden != true
              ? PostSideButtons(
                  commentOnTap: () {
                    showModal(context, widget.post.comments);
                  },
                  userProfileUrl: widget.post.userProfileUrl,
                  noComments: widget.post.comments.length.toString(),
                  noLikes: widget.post.noLikes.toString(),
                )
              : Container(),

          Positioned(
            right: isHidden != true ? 0 : null,
            left: isHidden == true ? 0 : null,
            bottom: 5,
            child: InkWell(
              onTap: () {
                setState(() {
                  isHidden = !isHidden;
                });
                widget.onHide!();
              },
              child: HideIcon(
                borderRadius: isHidden != true
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25))
                    : const BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                icon: Icon(
                  isHidden != true ? Icons.arrow_left : Icons.arrow_right,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> showModal(BuildContext context, List<CommentModel> comments) {
    return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) => CommentModal(
        name: "John",
        username: "@john",
        comments: widget.post.comments,
        userProfileUrl: widget.post.userProfileUrl,
      ),
    );
  }
}
