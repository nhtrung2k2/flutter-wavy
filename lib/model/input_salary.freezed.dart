// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_salary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InputSalary _$InputSalaryFromJson(Map<String, dynamic> json) {
  return _InputSalary.fromJson(json);
}

/// @nodoc
mixin _$InputSalary {
  @JsonKey(name: 'hourly_wage')
  int get hourlyWage => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_wage')
  int get monthlyWage => throw _privateConstructorUsedError;
  @JsonKey(name: 'item')
  List<ItemSalary> get itemSalary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InputSalaryCopyWith<InputSalary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputSalaryCopyWith<$Res> {
  factory $InputSalaryCopyWith(
          InputSalary value, $Res Function(InputSalary) then) =
      _$InputSalaryCopyWithImpl<$Res, InputSalary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'hourly_wage') int hourlyWage,
      @JsonKey(name: 'monthly_wage') int monthlyWage,
      @JsonKey(name: 'item') List<ItemSalary> itemSalary});
}

/// @nodoc
class _$InputSalaryCopyWithImpl<$Res, $Val extends InputSalary>
    implements $InputSalaryCopyWith<$Res> {
  _$InputSalaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourlyWage = null,
    Object? monthlyWage = null,
    Object? itemSalary = null,
  }) {
    return _then(_value.copyWith(
      hourlyWage: null == hourlyWage
          ? _value.hourlyWage
          : hourlyWage // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyWage: null == monthlyWage
          ? _value.monthlyWage
          : monthlyWage // ignore: cast_nullable_to_non_nullable
              as int,
      itemSalary: null == itemSalary
          ? _value.itemSalary
          : itemSalary // ignore: cast_nullable_to_non_nullable
              as List<ItemSalary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InputSalaryCopyWith<$Res>
    implements $InputSalaryCopyWith<$Res> {
  factory _$$_InputSalaryCopyWith(
          _$_InputSalary value, $Res Function(_$_InputSalary) then) =
      __$$_InputSalaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'hourly_wage') int hourlyWage,
      @JsonKey(name: 'monthly_wage') int monthlyWage,
      @JsonKey(name: 'item') List<ItemSalary> itemSalary});
}

/// @nodoc
class __$$_InputSalaryCopyWithImpl<$Res>
    extends _$InputSalaryCopyWithImpl<$Res, _$_InputSalary>
    implements _$$_InputSalaryCopyWith<$Res> {
  __$$_InputSalaryCopyWithImpl(
      _$_InputSalary _value, $Res Function(_$_InputSalary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourlyWage = null,
    Object? monthlyWage = null,
    Object? itemSalary = null,
  }) {
    return _then(_$_InputSalary(
      hourlyWage: null == hourlyWage
          ? _value.hourlyWage
          : hourlyWage // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyWage: null == monthlyWage
          ? _value.monthlyWage
          : monthlyWage // ignore: cast_nullable_to_non_nullable
              as int,
      itemSalary: null == itemSalary
          ? _value._itemSalary
          : itemSalary // ignore: cast_nullable_to_non_nullable
              as List<ItemSalary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InputSalary implements _InputSalary {
  const _$_InputSalary(
      {@JsonKey(name: 'hourly_wage') required this.hourlyWage,
      @JsonKey(name: 'monthly_wage') required this.monthlyWage,
      @JsonKey(name: 'item') required final List<ItemSalary> itemSalary})
      : _itemSalary = itemSalary;

  factory _$_InputSalary.fromJson(Map<String, dynamic> json) =>
      _$$_InputSalaryFromJson(json);

  @override
  @JsonKey(name: 'hourly_wage')
  final int hourlyWage;
  @override
  @JsonKey(name: 'monthly_wage')
  final int monthlyWage;
  final List<ItemSalary> _itemSalary;
  @override
  @JsonKey(name: 'item')
  List<ItemSalary> get itemSalary {
    if (_itemSalary is EqualUnmodifiableListView) return _itemSalary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemSalary);
  }

  @override
  String toString() {
    return 'InputSalary(hourlyWage: $hourlyWage, monthlyWage: $monthlyWage, itemSalary: $itemSalary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InputSalary &&
            (identical(other.hourlyWage, hourlyWage) ||
                other.hourlyWage == hourlyWage) &&
            (identical(other.monthlyWage, monthlyWage) ||
                other.monthlyWage == monthlyWage) &&
            const DeepCollectionEquality()
                .equals(other._itemSalary, _itemSalary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hourlyWage, monthlyWage,
      const DeepCollectionEquality().hash(_itemSalary));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InputSalaryCopyWith<_$_InputSalary> get copyWith =>
      __$$_InputSalaryCopyWithImpl<_$_InputSalary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InputSalaryToJson(
      this,
    );
  }
}

abstract class _InputSalary implements InputSalary {
  const factory _InputSalary(
          {@JsonKey(name: 'hourly_wage') required final int hourlyWage,
          @JsonKey(name: 'monthly_wage') required final int monthlyWage,
          @JsonKey(name: 'item') required final List<ItemSalary> itemSalary}) =
      _$_InputSalary;

  factory _InputSalary.fromJson(Map<String, dynamic> json) =
      _$_InputSalary.fromJson;

  @override
  @JsonKey(name: 'hourly_wage')
  int get hourlyWage;
  @override
  @JsonKey(name: 'monthly_wage')
  int get monthlyWage;
  @override
  @JsonKey(name: 'item')
  List<ItemSalary> get itemSalary;
  @override
  @JsonKey(ignore: true)
  _$$_InputSalaryCopyWith<_$_InputSalary> get copyWith =>
      throw _privateConstructorUsedError;
}
