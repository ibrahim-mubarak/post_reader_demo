// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonConvertersGenerator
// **************************************************************************

ToOne<Post> _$toOnePostFromJson(Map<String, dynamic>? json) => ToOne<Post>(
      target: json == null ? null : Post.fromJson(json),
      targetId: json?['id'] as int?,
    );

Map<String, dynamic>? _$toOnePostToJson(ToOne<Post> rel) =>
    rel.target?.toJson();

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
      post: _toOnePostFromJson(json['post'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
      'post': _toOnePostToJson(instance.post),
    };
