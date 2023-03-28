import 'package:dio/dio.dart';
import 'package:post_reader_demo/data/models/comment.dart';
import 'package:retrofit/retrofit.dart';

import 'package:post_reader_demo/data/models/post.dart';

part 'network_post_repository.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class NetworkPostRepository {
  factory NetworkPostRepository(Dio dio, {String baseUrl}) =
      _NetworkPostRepository;

  @GET('/posts')
  Future<List<Post>> getPosts();

  @GET('/posts/{id}/comments')
  Future<List<Comment>> getComments(@Path('id') int postId);
}
