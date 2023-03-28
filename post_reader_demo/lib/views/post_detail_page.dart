import 'package:flutter/material.dart';
import 'package:post_reader_demo/data/models/post.dart';
import 'package:post_reader_demo/data/services/post_service.dart';
import 'package:post_reader_demo/views/comments_card.dart';

class PostDetailPage extends StatelessWidget {
  final int postId;
  final PostsService _postService = PostsService();

  PostDetailPage({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Detail: $postId')),
      body: buildBody(),
    );
  }

  StreamBuilder<Post> buildBody() {
    return StreamBuilder<Post>(
      stream: _postService.getPost(postId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final post = snapshot.requireData;

        return Column(
          children: [
            const SizedBox(height: 16),
            buildPostCard(post, context),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            Expanded(child: CommentsCard(postId: postId)),
          ],
        );
      },
    );
  }

  Card buildPostCard(Post post, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
      ),
    );
  }
}
