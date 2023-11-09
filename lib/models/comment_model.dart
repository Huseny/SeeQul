import 'package:seequl/models/reply_model.dart';

class CommentModel {
  final String commentorUsername;
  final String commentorName;
  final String commentorProfileUrl;

  final String comment;

  final int noLikes;
  final int noShares;

  final List<Reply> replies;

  const CommentModel(
      {required this.commentorUsername,
      required this.commentorName,
      required this.commentorProfileUrl,
      required this.comment,
      required this.noLikes,
      required this.noShares,
      required this.replies});
}
