import 'dart:async';

import 'package:dio/dio.dart';
import 'package:post_reader_demo/data/models/comment.dart';
import 'package:post_reader_demo/data/repositories/local_comment_repository.dart';
import 'package:post_reader_demo/data/repositories/network_post_repository.dart';

class CommentsService {
  final NetworkPostRepository _postRepository = NetworkPostRepository(Dio());
  final LocalCommentRepository _localCommentRepository =
      LocalCommentRepository();

  CommentsService();

  Stream<List<Comment>> getCommentsForPost(int postId) {
    var commentStream = _localCommentRepository.getCommentsForPost(postId);

    _postRepository
        .getComments(postId)
        .then((commentList) => commentList
            .map((comment) => comment..post.targetId = postId)
            .toList())
        .then((value) => _localCommentRepository.putMany(value));

    return commentStream;
  }
}
