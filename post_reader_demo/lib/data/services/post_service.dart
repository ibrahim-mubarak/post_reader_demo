import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:post_reader_demo/data/models/post.dart';
import 'package:post_reader_demo/data/repositories/local_post_repository.dart';

class PostsService {
  final LocalPostRepository _localPostRepository = LocalPostRepository();

  PostsService();

  Stream<List<Post>> getAllPosts() {
    var stream = _localPostRepository.getAll();

    getPostsWithComments().then((value) => _localPostRepository.putMany(value));

    return stream;
  }

  Stream<Post> getPost(int postId) {
    var postStream = _localPostRepository.getPost(postId);

    getPostsWithComments().then((value) => _localPostRepository.putMany(value));

    return postStream;
  }

  /// Simulating a Post which returns a list of Post with Comments
  /// JsonPlaceholder doesn't have a Post with Comments API
  Future<List<Post>> getPostsWithComments() async {
    final response = await rootBundle.loadString('assets/post_comments.json');
    final data = await json.decode(response);
    var list = data.map<Post>((json) => Post.fromJson(json)).toList();

    return list;
  }
}
