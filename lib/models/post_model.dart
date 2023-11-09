import 'package:seequl/models/comment_model.dart';

class Post {
  final String username;
  final String userProfileUrl;
  final String postImageUrl;
  final String caption;
  final List<CommentModel> comments;
  final int noLikes;

  const Post(
      {required this.username,
      required this.userProfileUrl,
      required this.postImageUrl,
      required this.caption,
      required this.comments,
      required this.noLikes});
}
