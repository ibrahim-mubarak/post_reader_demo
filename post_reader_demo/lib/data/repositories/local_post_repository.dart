import 'dart:async';

import 'package:post_reader_demo/data/models/post.dart';
import 'package:post_reader_demo/data/store.dart';
import 'package:post_reader_demo/objectbox.g.dart';

class LocalPostRepository {
  var postBox = objectbox.store.box<Post>();

  Stream<List<Post>> getAll() {
    StreamController<List<Post>> controller = StreamController();

    postBox.query().watch(triggerImmediately: true).listen((event) {
      var allPosts = event.find();

      controller.add(allPosts.map((post) => post..comments.toList()).toList());
    });

    return controller.stream;
  }

  Future<List<int>> putMany(List<Post> posts) {
    return postBox.putManyAsync(posts);
  }

  Stream<Post> getPost(int postId) {
    StreamController<Post> controller = StreamController();

    postBox
        .query(Post_.id.equals(postId))
        .watch(triggerImmediately: true)
        .listen((query) {
      var post = query.findFirst();
      if (post != null) {
        controller.add(post);
      }
    });

    return controller.stream;
  }
}
