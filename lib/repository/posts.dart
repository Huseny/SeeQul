import 'package:seequl/models/post_model.dart';
import 'package:seequl/models/comment_model.dart';
import 'package:seequl/models/reply_model.dart';

class Posts {
  static List<Post> getPosts() {
    List<Post> posts = [];

    // Post 1
    CommentModel comment1 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user1',
      commentorName: 'User One',
      noLikes: 10,
      noShares: 5,
      replies: [
        Reply(
          replierUsername: 'user2',
          replierName: 'User Two',
          reply: 'This is a reply to comment 1.',
          noLikes: '2',
          noShares: '1',
        ),
      ],
    );

    CommentModel comment2 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user2',
      commentorName: 'User Two',
      noLikes: 15,
      noShares: 8,
      replies: [],
    );

    Post post1 = Post(
      username: 'user1',
      userProfileUrl: 'lib/assets/profile.png',
      postImageUrl: 'lib/assets/post image.png',
      caption:
          'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident laborum? Dolores numquam cumque minima velit ex voluptatem voluptate amet, adipisci est, facilis esse. Molestias rem rerum, reprehenderit obcaecati totam accusamus, sed fugit tempora consequatur quaerat quos laborum. Cum voluptates nemo vitae est vero, similique iure doloribus harum, saepe dolore quisquam itaque iste excepturi nihil sapiente autem rem repudiandae repellat. Vitae enim facere suscipit quia quo autem sed, odio neque laborum, eos libero illum aspernatur iure natus similique commodi? Totam ullam tenetur beatae. Ipsum quidem voluptates iure neque molestiae quia aliquam adipisci, ipsa ducimus assumenda soluta dicta ea sint at praesentium. Libero quasi expedita illum laborum. Consequuntur nisi impedit, aliquam rerum quibusdam debitis ut reiciendis doloribus fugiat, adipisci illo enim quo molestiae sit quod deserunt? Veniam facere harum molestias earum magnam vel distinctio natus, officiis labore!',
      comments: [comment1, comment2],
      noLikes: 20,
    );

    posts.add(post1);

    // Post 2
    CommentModel comment3 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user3',
      commentorName: 'User Three',
      noLikes: 5,
      noShares: 2,
      replies: [
        Reply(
          replierUsername: 'user4',
          replierName: 'User Four',
          reply: 'Reply to comment 3.',
          noLikes: '3',
          noShares: '1',
        ),
        Reply(
          replierUsername: 'user5',
          replierName: 'User Five',
          reply: 'Another reply to comment 3.',
          noLikes: '2',
          noShares: '2',
        ),
      ],
    );

    CommentModel comment4 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user2',
      commentorName: 'User Two',
      noLikes: 8,
      noShares: 4,
      replies: [],
    );

    Post post2 = Post(
      username: 'user2',
      userProfileUrl: 'lib/assets/profile.png',
      postImageUrl: 'lib/assets/post image.png',
      caption: 'This is post 2',
      comments: [comment3, comment4],
      noLikes: 15,
    );

    posts.add(post2);

    // Post 3
    CommentModel comment5 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user1',
      commentorName: 'User One',
      noLikes: 12,
      noShares: 7,
      replies: [],
    );

    CommentModel comment6 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user3',
      commentorName: 'User Three',
      noLikes: 18,
      noShares: 9,
      replies: [
        Reply(
          replierUsername: 'user1',
          replierName: 'User One',
          reply: 'Reply to comment 6.',
          noLikes: '5',
          noShares: '2',
        ),
      ],
    );

    Post post3 = Post(
      username: 'user3',
      postImageUrl: 'lib/assets/post image.png',
      caption: 'This is post 3',
      comments: [comment5, comment6],
      noLikes: 25,
      userProfileUrl: 'lib/assets/profile.png',
    );

    posts.add(post3);

    // Post 4
    CommentModel comment7 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user4',
      commentorName: 'User Four',
      noLikes: 8,
      noShares: 4,
      replies: [],
    );

    Post post4 = Post(
      username: 'user4',
      userProfileUrl: 'lib/assets/profile.png',
      postImageUrl: 'lib/assets/post image.png',
      caption: 'This is post 4',
      comments: [comment7],
      noLikes: 10,
    );

    posts.add(post4);

    // Post 5
    CommentModel comment8 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user5',
      commentorName: 'User Five',
      noLikes: 5,
      noShares: 3,
      replies: [],
    );

    CommentModel comment9 = const CommentModel(
      comment:
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Illo ullam explicabo excepturi nihil deleniti quas autem nisi repellat sint. Veritatis totam voluptas rerum dolor iste molestiae accusantium expedita quis inventore quibusdam, vitae labore ad sapiente, dolorem aperiam odit cum, quam quod itaque delectus provident",
      commentorProfileUrl: "lib/assets/profile.png",
      commentorUsername: 'user2',
      commentorName: 'User Two',
      noLikes: 15,
      noShares: 7,
      replies: [
        Reply(
          replierUsername: 'user5',
          replierName: 'User Five',
          reply: 'Reply to comment 9.',
          noLikes: '4',
          noShares: '1',
        ),
      ],
    );

    Post post5 = Post(
      username: 'user5',
      userProfileUrl: 'lib/assets/profile.png',
      postImageUrl: 'lib/assets/post image.png',
      caption: 'This is post 5',
      comments: [comment8, comment9],
      noLikes: 18,
    );

    posts.add(post5);

    return posts;
  }
}
