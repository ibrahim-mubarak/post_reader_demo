import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_reader_demo/data/models/post.dart';
import 'package:json_converter_generator_annotation/generate_converters.dart';
import 'package:objectbox/objectbox.dart';

part 'comment.freezed.dart';

part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @Entity(realClass: Comment)
  @generateConverters
  const factory Comment({
    @Id(assignable: true) required int id,
    required String name,
    required String email,
    required String body,
    @JsonKey(fromJson: _toOnePostFromJson, toJson: _toOnePostToJson)
        required ToOne<Post> post,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

ToOne<Post> _toOnePostFromJson(Map<String, dynamic>? json) =>
    _$toOnePostFromJson(json);

Map<String, dynamic>? _toOnePostToJson(ToOne<Post> object) =>
    _$toOnePostToJson(object);
