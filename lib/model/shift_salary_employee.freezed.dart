// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_salary_employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShiftSalaryEmployee _$ShiftSalaryEmployeeFromJson(Map<String, dynamic> json) {
  return _ShiftSalaryEmployee.fromJson(json);
}

/// @nodoc
mixin _$ShiftSalaryEmployee {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'babysistter_id')
  String get babysistterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_id')
  int? get shiftId => throw _privateConstructorUsedError;
  @JsonKey(name: 'input_shift')
  List<InputShift> get inputShift => throw _privateConstructorUsedError;
  @JsonKey(name: 'input_salary')
  InputSalary get inputSalary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftSalaryEmployeeCopyWith<ShiftSalaryEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftSalaryEmployeeCopyWith<$Res> {
  factory $ShiftSalaryEmployeeCopyWith(
          ShiftSalaryEmployee value, $Res Function(ShiftSalaryEmployee) then) =
      _$ShiftSalaryEmployeeCopyWithImpl<$Res, ShiftSalaryEmployee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'babysistter_id') String babysistterId,
      @JsonKey(name: 'shift_id') int? shiftId,
      @JsonKey(name: 'input_shift') List<InputShift> inputShift,
      @JsonKey(name: 'input_salary') InputSalary inputSalary});

  $InputSalaryCopyWith<$Res> get inputSalary;
}

/// @nodoc
class _$ShiftSalaryEmployeeCopyWithImpl<$Res, $Val extends ShiftSalaryEmployee>
    implements $ShiftSalaryEmployeeCopyWith<$Res> {
  _$ShiftSalaryEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? babysistterId = null,
    Object? shiftId = freezed,
    Object? inputShift = null,
    Object? inputSalary = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      babysistterId: null == babysistterId
          ? _value.babysistterId
          : babysistterId // ignore: cast_nullable_to_non_nullable
              as String,
      shiftId: freezed == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int?,
      inputShift: null == inputShift
          ? _value.inputShift
          : inputShift // ignore: cast_nullable_to_non_nullable
              as List<InputShift>,
      inputSalary: null == inputSalary
          ? _value.inputSalary
          : inputSalary // ignore: cast_nullable_to_non_nullable
              as InputSalary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InputSalaryCopyWith<$Res> get inputSalary {
    return $InputSalaryCopyWith<$Res>(_value.inputSalary, (value) {
      return _then(_value.copyWith(inputSalary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ShiftSalaryEmployeeCopyWith<$Res>
    implements $ShiftSalaryEmployeeCopyWith<$Res> {
  factory _$$_ShiftSalaryEmployeeCopyWith(_$_ShiftSalaryEmployee value,
          $Res Function(_$_ShiftSalaryEmployee) then) =
      __$$_ShiftSalaryEmployeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'babysistter_id') String babysistterId,
      @JsonKey(name: 'shift_id') int? shiftId,
      @JsonKey(name: 'input_shift') List<InputShift> inputShift,
      @JsonKey(name: 'input_salary') InputSalary inputSalary});

  @override
  $InputSalaryCopyWith<$Res> get inputSalary;
}

/// @nodoc
class __$$_ShiftSalaryEmployeeCopyWithImpl<$Res>
    extends _$ShiftSalaryEmployeeCopyWithImpl<$Res, _$_ShiftSalaryEmployee>
    implements _$$_ShiftSalaryEmployeeCopyWith<$Res> {
  __$$_ShiftSalaryEmployeeCopyWithImpl(_$_ShiftSalaryEmployee _value,
      $Res Function(_$_ShiftSalaryEmployee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? babysistterId = null,
    Object? shiftId = freezed,
    Object? inputShift = null,
    Object? inputSalary = null,
  }) {
    return _then(_$_ShiftSalaryEmployee(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      babysistterId: null == babysistterId
          ? _value.babysistterId
          : babysistterId // ignore: cast_nullable_to_non_nullable
              as String,
      shiftId: freezed == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int?,
      inputShift: null == inputShift
          ? _value._inputShift
          : inputShift // ignore: cast_nullable_to_non_nullable
              as List<InputShift>,
      inputSalary: null == inputSalary
          ? _value.inputSalary
          : inputSalary // ignore: cast_nullable_to_non_nullable
              as InputSalary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShiftSalaryEmployee implements _ShiftSalaryEmployee {
  const _$_ShiftSalaryEmployee(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'babysistter_id') required this.babysistterId,
      @JsonKey(name: 'shift_id') required this.shiftId,
      @JsonKey(name: 'input_shift') required final List<InputShift> inputShift,
      @JsonKey(name: 'input_salary') required this.inputSalary})
      : _inputShift = inputShift;

  factory _$_ShiftSalaryEmployee.fromJson(Map<String, dynamic> json) =>
      _$$_ShiftSalaryEmployeeFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'babysistter_id')
  final String babysistterId;
  @override
  @JsonKey(name: 'shift_id')
  final int? shiftId;
  final List<InputShift> _inputShift;
  @override
  @JsonKey(name: 'input_shift')
  List<InputShift> get inputShift {
    if (_inputShift is EqualUnmodifiableListView) return _inputShift;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputShift);
  }

  @override
  @JsonKey(name: 'input_salary')
  final InputSalary inputSalary;

  @override
  String toString() {
    return 'ShiftSalaryEmployee(userId: $userId, babysistterId: $babysistterId, shiftId: $shiftId, inputShift: $inputShift, inputSalary: $inputSalary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShiftSalaryEmployee &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.babysistterId, babysistterId) ||
                other.babysistterId == babysistterId) &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            const DeepCollectionEquality()
                .equals(other._inputShift, _inputShift) &&
            (identical(other.inputSalary, inputSalary) ||
                other.inputSalary == inputSalary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, babysistterId, shiftId,
      const DeepCollectionEquality().hash(_inputShift), inputSalary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShiftSalaryEmployeeCopyWith<_$_ShiftSalaryEmployee> get copyWith =>
      __$$_ShiftSalaryEmployeeCopyWithImpl<_$_ShiftSalaryEmployee>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShiftSalaryEmployeeToJson(
      this,
    );
  }
}

abstract class _ShiftSalaryEmployee implements ShiftSalaryEmployee {
  const factory _ShiftSalaryEmployee(
      {@JsonKey(name: 'user_id')
          required final String userId,
      @JsonKey(name: 'babysistter_id')
          required final String babysistterId,
      @JsonKey(name: 'shift_id')
          required final int? shiftId,
      @JsonKey(name: 'input_shift')
          required final List<InputShift> inputShift,
      @JsonKey(name: 'input_salary')
          required final InputSalary inputSalary}) = _$_ShiftSalaryEmployee;

  factory _ShiftSalaryEmployee.fromJson(Map<String, dynamic> json) =
      _$_ShiftSalaryEmployee.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'babysistter_id')
  String get babysistterId;
  @override
  @JsonKey(name: 'shift_id')
  int? get shiftId;
  @override
  @JsonKey(name: 'input_shift')
  List<InputShift> get inputShift;
  @override
  @JsonKey(name: 'input_salary')
  InputSalary get inputSalary;
  @override
  @JsonKey(ignore: true)
  _$$_ShiftSalaryEmployeeCopyWith<_$_ShiftSalaryEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}
