// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Employee_Detail _$Employee_DetailFromJson(Map<String, dynamic> json) {
  return _Employee_Detail.fromJson(json);
}

/// @nodoc
mixin _$Employee_Detail {
  @JsonKey(name: 'babysistter_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_contract_date')
  DateTime? get cancel__contract_date => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Employee_DetailCopyWith<Employee_Detail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Employee_DetailCopyWith<$Res> {
  factory $Employee_DetailCopyWith(
          Employee_Detail value, $Res Function(Employee_Detail) then) =
      _$Employee_DetailCopyWithImpl<$Res, Employee_Detail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'babysistter_id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'cancel_contract_date') DateTime? cancel__contract_date,
      String avatar});
}

/// @nodoc
class _$Employee_DetailCopyWithImpl<$Res, $Val extends Employee_Detail>
    implements $Employee_DetailCopyWith<$Res> {
  _$Employee_DetailCopyWithImpl(this._value, this._then);

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
    Object? cancel__contract_date = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      cancel__contract_date: freezed == cancel__contract_date
          ? _value.cancel__contract_date
          : cancel__contract_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Employee_DetailCopyWith<$Res>
    implements $Employee_DetailCopyWith<$Res> {
  factory _$$_Employee_DetailCopyWith(
          _$_Employee_Detail value, $Res Function(_$_Employee_Detail) then) =
      __$$_Employee_DetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'babysistter_id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'cancel_contract_date') DateTime? cancel__contract_date,
      String avatar});
}

/// @nodoc
class __$$_Employee_DetailCopyWithImpl<$Res>
    extends _$Employee_DetailCopyWithImpl<$Res, _$_Employee_Detail>
    implements _$$_Employee_DetailCopyWith<$Res> {
  __$$_Employee_DetailCopyWithImpl(
      _$_Employee_Detail _value, $Res Function(_$_Employee_Detail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? cancel__contract_date = freezed,
    Object? avatar = null,
  }) {
    return _then(_$_Employee_Detail(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      cancel__contract_date: freezed == cancel__contract_date
          ? _value.cancel__contract_date
          : cancel__contract_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Employee_Detail implements _Employee_Detail {
  const _$_Employee_Detail(
      {@JsonKey(name: 'babysistter_id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'cancel_contract_date') this.cancel__contract_date,
      this.avatar =
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"});

  factory _$_Employee_Detail.fromJson(Map<String, dynamic> json) =>
      _$$_Employee_DetailFromJson(json);

  @override
  @JsonKey(name: 'babysistter_id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'cancel_contract_date')
  final DateTime? cancel__contract_date;
  @override
  @JsonKey()
  final String avatar;

  @override
  String toString() {
    return 'Employee_Detail(id: $id, name: $name, email: $email, cancel__contract_date: $cancel__contract_date, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Employee_Detail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cancel__contract_date, cancel__contract_date) ||
                other.cancel__contract_date == cancel__contract_date) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, cancel__contract_date, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Employee_DetailCopyWith<_$_Employee_Detail> get copyWith =>
      __$$_Employee_DetailCopyWithImpl<_$_Employee_Detail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Employee_DetailToJson(
      this,
    );
  }
}

abstract class _Employee_Detail implements Employee_Detail {
  const factory _Employee_Detail(
      {@JsonKey(name: 'babysistter_id')
          required final String id,
      @JsonKey(name: 'name')
          required final String name,
      @JsonKey(name: 'email')
          required final String email,
      @JsonKey(name: 'cancel_contract_date')
          final DateTime? cancel__contract_date,
      final String avatar}) = _$_Employee_Detail;

  factory _Employee_Detail.fromJson(Map<String, dynamic> json) =
      _$_Employee_Detail.fromJson;

  @override
  @JsonKey(name: 'babysistter_id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'cancel_contract_date')
  DateTime? get cancel__contract_date;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_Employee_DetailCopyWith<_$_Employee_Detail> get copyWith =>
      throw _privateConstructorUsedError;
}
