import 'package:flutter/material.dart';
import 'package:post_reader_demo/data/models/comment.dart';
import 'package:post_reader_demo/data/services/comments_service.dart';

class CommentsCard extends StatelessWidget {
  CommentsCard({super.key, required this.postId});

  final int postId;

  final CommentsService _commentsService = CommentsService();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: StreamBuilder<List<Comment>>(
        stream: _commentsService.getCommentsForPost(postId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final comments = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Comments (${comments.length})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                ...comments.map((e) => buildCommentsCard(e, context)),
              ],
            ),
          );
        },
      ),
    );
  }

  ListTile buildCommentsCard(Comment comment, BuildContext context) {
    return ListTile(
      title: Text(comment.name),
      subtitle: Text(comment.body),
    );
  }
}
