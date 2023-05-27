// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of User;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'user_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String id,
      @JsonKey(name: 'name') String name,
      String avatar});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String id,
      @JsonKey(name: 'name') String name,
      String avatar});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {@JsonKey(name: 'user_id') required this.id,
      @JsonKey(name: 'name') required this.name,
      this.avatar =
          "data:image/png;base64,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"});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey()
  final String avatar;

  @override
  String toString() {
    return 'User(id: $id, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'user_id') required final String id,
      @JsonKey(name: 'name') required final String name,
      final String avatar}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
