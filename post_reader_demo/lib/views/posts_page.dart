import 'package:flutter/material.dart';
import 'package:post_reader_demo/data/models/post.dart';
import 'package:post_reader_demo/data/services/post_service.dart';
import 'package:post_reader_demo/views/post_detail_page.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  final PostsService _postService = PostsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: buildBody(),
    );
  }

  Center buildBody() {
    return Center(
      child: StreamBuilder<List<Post>>(
        stream: _postService.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final posts = snapshot.requireData;

          return ListView.builder(
            itemBuilder: (ctx, i) => ListTile(
              title: Text(posts[i].title),
              onTap: () => showPostDetails(posts[i].id),
            ),
            itemCount: posts.length,
          );
        },
      ),
    );
  }

  void showPostDetails(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostDetailPage(postId: id)),
    );
  }
}
