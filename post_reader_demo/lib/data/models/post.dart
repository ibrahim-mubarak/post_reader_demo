import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_reader_demo/data/models/comment.dart';

import 'package:json_converter_generator_annotation/generate_converters.dart';

import 'package:objectbox/objectbox.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class Post with _$Post {
  @Entity(realClass: Post)
  @generateConverters
  const factory Post({
    @Id(assignable: true) required int id,
    required int userId,
    required String title,
    required String body,
    @JsonKey(fromJson: _toManyCommentFromJson, toJson: _toManyCommentToJson)
    @Backlink('post')
        required ToMany<Comment> comments,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

ToMany<Comment> _toManyCommentFromJson(List<dynamic> json) =>
    _$ToManyCommentFromJson(json.cast());

List<dynamic> _toManyCommentToJson(ToMany<Comment> object) =>
    _$ToManyCommentToJson(object);
