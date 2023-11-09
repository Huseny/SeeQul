class Reply {
  final String replierUsername;
  final String replierName;

  final String reply;
  final String noLikes;
  final String noShares;

  const Reply(
      {required this.replierUsername,
      required this.replierName,
      required this.reply,
      required this.noLikes,
      required this.noShares});
}
