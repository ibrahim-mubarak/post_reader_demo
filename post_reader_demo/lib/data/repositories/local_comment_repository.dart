import 'dart:async';

import 'package:post_reader_demo/data/models/comment.dart';
import 'package:post_reader_demo/data/store.dart';
import 'package:post_reader_demo/objectbox.g.dart';

class LocalCommentRepository {
  var commentBox = objectbox.store.box<Comment>();

  Stream<List<Comment>> getCommentsForPost(int postId) {
    StreamController<List<Comment>> controller = StreamController();

    commentBox
        .query(Comment_.post.equals(postId))
        .watch(triggerImmediately: true)
        .listen((event) => controller.add(event.find()));

    return controller.stream;
  }

  Future<void> putMany(List<Comment> value) async {
    commentBox.putMany(value);
  }
}
