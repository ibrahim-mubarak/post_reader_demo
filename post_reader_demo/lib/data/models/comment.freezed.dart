// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  @Id(assignable: true)
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toOnePostFromJson, toJson: _toOnePostToJson)
  ToOne<Post> get post => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {@Id(assignable: true)
          int id,
      String name,
      String email,
      String body,
      @JsonKey(fromJson: _toOnePostFromJson, toJson: _toOnePostToJson)
          ToOne<Post> post});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? body = null,
    Object? post = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as ToOne<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true)
          int id,
      String name,
      String email,
      String body,
      @JsonKey(fromJson: _toOnePostFromJson, toJson: _toOnePostToJson)
          ToOne<Post> post});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$_Comment>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? body = null,
    Object? post = null,
  }) {
    return _then(_$_Comment(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as ToOne<Post>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Entity(realClass: Comment)
@generateConverters
class _$_Comment with DiagnosticableTreeMixin implements _Comment {
  const _$_Comment(
      {@Id(assignable: true)
          required this.id,
      required this.name,
      required this.email,
      required this.body,
      @JsonKey(fromJson: _toOnePostFromJson, toJson: _toOnePostToJson)
          required this.post});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  @Id(assignable: true)
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String body;
  @override
  @JsonKey(fromJson: _toOnePostFromJson, toJson: _toOnePostToJson)
  final ToOne<Post> post;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Comment(id: $id, name: $name, email: $email, body: $body, post: $post)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Comment'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('post', post));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.post, post) || other.post == post));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, body, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {@Id(assignable: true)
          required final int id,
      required final String name,
      required final String email,
      required final String body,
      @JsonKey(fromJson: _toOnePostFromJson, toJson: _toOnePostToJson)
          required final ToOne<Post> post}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  @Id(assignable: true)
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get body;
  @override
  @JsonKey(fromJson: _toOnePostFromJson, toJson: _toOnePostToJson)
  ToOne<Post> get post;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
