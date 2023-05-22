// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  @JsonKey(name: 'babysistter_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  String get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_id')
  int get shiftId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_contract_date')
  DateTime? get cancel__contract_date => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'babysistter_id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'age') String age,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'shift_id') int shiftId,
      @JsonKey(name: 'cancel_contract_date') DateTime? cancel__contract_date,
      String avatar});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
    Object? city = null,
    Object? shiftId = null,
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
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$$_EmployeeCopyWith(
          _$_Employee value, $Res Function(_$_Employee) then) =
      __$$_EmployeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'babysistter_id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'age') String age,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'shift_id') int shiftId,
      @JsonKey(name: 'cancel_contract_date') DateTime? cancel__contract_date,
      String avatar});
}

/// @nodoc
class __$$_EmployeeCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$_Employee>
    implements _$$_EmployeeCopyWith<$Res> {
  __$$_EmployeeCopyWithImpl(
      _$_Employee _value, $Res Function(_$_Employee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
    Object? city = null,
    Object? shiftId = null,
    Object? cancel__contract_date = freezed,
    Object? avatar = null,
  }) {
    return _then(_$_Employee(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_Employee implements _Employee {
  const _$_Employee(
      {@JsonKey(name: 'babysistter_id')
          required this.id,
      @JsonKey(name: 'name')
          required this.name,
      @JsonKey(name: 'age')
          required this.age,
      @JsonKey(name: 'city')
          required this.city,
      @JsonKey(name: 'shift_id')
          required this.shiftId,
      @JsonKey(name: 'cancel_contract_date')
          required this.cancel__contract_date,
      this.avatar =
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"});

  factory _$_Employee.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeFromJson(json);

  @override
  @JsonKey(name: 'babysistter_id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'age')
  final String age;
  @override
  @JsonKey(name: 'city')
  final String city;
  @override
  @JsonKey(name: 'shift_id')
  final int shiftId;
  @override
  @JsonKey(name: 'cancel_contract_date')
  final DateTime? cancel__contract_date;
  @override
  @JsonKey()
  final String avatar;

  @override
  String toString() {
    return 'Employee(id: $id, name: $name, age: $age, city: $city, shiftId: $shiftId, cancel__contract_date: $cancel__contract_date, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Employee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.cancel__contract_date, cancel__contract_date) ||
                other.cancel__contract_date == cancel__contract_date) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, age, city, shiftId, cancel__contract_date, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      __$$_EmployeeCopyWithImpl<_$_Employee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeToJson(
      this,
    );
  }
}

abstract class _Employee implements Employee {
  const factory _Employee(
      {@JsonKey(name: 'babysistter_id')
          required final String id,
      @JsonKey(name: 'name')
          required final String name,
      @JsonKey(name: 'age')
          required final String age,
      @JsonKey(name: 'city')
          required final String city,
      @JsonKey(name: 'shift_id')
          required final int shiftId,
      @JsonKey(name: 'cancel_contract_date')
          required final DateTime? cancel__contract_date,
      final String avatar}) = _$_Employee;

  factory _Employee.fromJson(Map<String, dynamic> json) = _$_Employee.fromJson;

  @override
  @JsonKey(name: 'babysistter_id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'age')
  String get age;
  @override
  @JsonKey(name: 'city')
  String get city;
  @override
  @JsonKey(name: 'shift_id')
  int get shiftId;
  @override
  @JsonKey(name: 'cancel_contract_date')
  DateTime? get cancel__contract_date;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      throw _privateConstructorUsedError;
}
