// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonConvertersGenerator
// **************************************************************************

ToMany<Comment> _$ToManyCommentFromJson(List<Map<String, dynamic>> json) =>
    ToMany<Comment>(items: json.map((e) => Comment.fromJson(e)).toList());

List<Map<String, dynamic>> _$ToManyCommentToJson(ToMany<Comment> rel) =>
    rel.map((Comment obj) => obj.toJson()).toList();

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      comments: _toManyCommentFromJson(json['comments'] as List),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'comments': _toManyCommentToJson(instance.comments),
    };
