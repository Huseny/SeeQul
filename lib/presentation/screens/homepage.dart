import 'package:flutter/material.dart';
import 'package:seequl/models/post_model.dart';
import 'package:seequl/presentation/components/post_components/post_template.dart';
import 'package:seequl/repository/posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.onHide});

  final void Function()? onHide;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> _posts = Posts.getPosts();

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: controller,
          itemCount: _posts.length,
          itemBuilder: (context, index) => PostTemplate(
                onHide: widget.onHide,
                post: _posts[index],
              )),
    );
  }
}
