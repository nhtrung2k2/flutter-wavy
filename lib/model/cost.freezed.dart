// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cost _$CostFromJson(Map<String, dynamic> json) {
  return _Cost.fromJson(json);
}

/// @nodoc
mixin _$Cost {
  @JsonKey(name: 'amount_date')
  String get amountDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'labour_cost')
  int get labourCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'working_time')
  String get workingTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'hour_woking')
  int get hourWorking => throw _privateConstructorUsedError;
  @JsonKey(name: 'hourly_wage')
  int get hourlyWave => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_flag')
  int get confirmFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  int get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_1')
  String? get picture1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_2')
  String? get picture2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_3')
  String? get picture3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CostCopyWith<Cost> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostCopyWith<$Res> {
  factory $CostCopyWith(Cost value, $Res Function(Cost) then) =
      _$CostCopyWithImpl<$Res, Cost>;
  @useResult
  $Res call(
      {@JsonKey(name: 'amount_date') String amountDate,
      @JsonKey(name: 'labour_cost') int labourCost,
      @JsonKey(name: 'working_time') String workingTime,
      @JsonKey(name: 'hour_woking') int hourWorking,
      @JsonKey(name: 'hourly_wage') int hourlyWave,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'confirm_flag') int confirmFlag,
      @JsonKey(name: 'payment_status') int paymentStatus,
      @JsonKey(name: 'picture_1') String? picture1,
      @JsonKey(name: 'picture_2') String? picture2,
      @JsonKey(name: 'picture_3') String? picture3,
      @JsonKey(name: 'items') List<Item> items});
}

/// @nodoc
class _$CostCopyWithImpl<$Res, $Val extends Cost>
    implements $CostCopyWith<$Res> {
  _$CostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountDate = null,
    Object? labourCost = null,
    Object? workingTime = null,
    Object? hourWorking = null,
    Object? hourlyWave = null,
    Object? amount = null,
    Object? confirmFlag = null,
    Object? paymentStatus = null,
    Object? picture1 = freezed,
    Object? picture2 = freezed,
    Object? picture3 = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      amountDate: null == amountDate
          ? _value.amountDate
          : amountDate // ignore: cast_nullable_to_non_nullable
              as String,
      labourCost: null == labourCost
          ? _value.labourCost
          : labourCost // ignore: cast_nullable_to_non_nullable
              as int,
      workingTime: null == workingTime
          ? _value.workingTime
          : workingTime // ignore: cast_nullable_to_non_nullable
              as String,
      hourWorking: null == hourWorking
          ? _value.hourWorking
          : hourWorking // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyWave: null == hourlyWave
          ? _value.hourlyWave
          : hourlyWave // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      confirmFlag: null == confirmFlag
          ? _value.confirmFlag
          : confirmFlag // ignore: cast_nullable_to_non_nullable
              as int,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      picture1: freezed == picture1
          ? _value.picture1
          : picture1 // ignore: cast_nullable_to_non_nullable
              as String?,
      picture2: freezed == picture2
          ? _value.picture2
          : picture2 // ignore: cast_nullable_to_non_nullable
              as String?,
      picture3: freezed == picture3
          ? _value.picture3
          : picture3 // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CostCopyWith<$Res> implements $CostCopyWith<$Res> {
  factory _$$_CostCopyWith(_$_Cost value, $Res Function(_$_Cost) then) =
      __$$_CostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'amount_date') String amountDate,
      @JsonKey(name: 'labour_cost') int labourCost,
      @JsonKey(name: 'working_time') String workingTime,
      @JsonKey(name: 'hour_woking') int hourWorking,
      @JsonKey(name: 'hourly_wage') int hourlyWave,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'confirm_flag') int confirmFlag,
      @JsonKey(name: 'payment_status') int paymentStatus,
      @JsonKey(name: 'picture_1') String? picture1,
      @JsonKey(name: 'picture_2') String? picture2,
      @JsonKey(name: 'picture_3') String? picture3,
      @JsonKey(name: 'items') List<Item> items});
}

/// @nodoc
class __$$_CostCopyWithImpl<$Res> extends _$CostCopyWithImpl<$Res, _$_Cost>
    implements _$$_CostCopyWith<$Res> {
  __$$_CostCopyWithImpl(_$_Cost _value, $Res Function(_$_Cost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountDate = null,
    Object? labourCost = null,
    Object? workingTime = null,
    Object? hourWorking = null,
    Object? hourlyWave = null,
    Object? amount = null,
    Object? confirmFlag = null,
    Object? paymentStatus = null,
    Object? picture1 = freezed,
    Object? picture2 = freezed,
    Object? picture3 = freezed,
    Object? items = null,
  }) {
    return _then(_$_Cost(
      amountDate: null == amountDate
          ? _value.amountDate
          : amountDate // ignore: cast_nullable_to_non_nullable
              as String,
      labourCost: null == labourCost
          ? _value.labourCost
          : labourCost // ignore: cast_nullable_to_non_nullable
              as int,
      workingTime: null == workingTime
          ? _value.workingTime
          : workingTime // ignore: cast_nullable_to_non_nullable
              as String,
      hourWorking: null == hourWorking
          ? _value.hourWorking
          : hourWorking // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyWave: null == hourlyWave
          ? _value.hourlyWave
          : hourlyWave // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      confirmFlag: null == confirmFlag
          ? _value.confirmFlag
          : confirmFlag // ignore: cast_nullable_to_non_nullable
              as int,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      picture1: freezed == picture1
          ? _value.picture1
          : picture1 // ignore: cast_nullable_to_non_nullable
              as String?,
      picture2: freezed == picture2
          ? _value.picture2
          : picture2 // ignore: cast_nullable_to_non_nullable
              as String?,
      picture3: freezed == picture3
          ? _value.picture3
          : picture3 // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cost implements _Cost {
  const _$_Cost(
      {@JsonKey(name: 'amount_date') required this.amountDate,
      @JsonKey(name: 'labour_cost') required this.labourCost,
      @JsonKey(name: 'working_time') required this.workingTime,
      @JsonKey(name: 'hour_woking') required this.hourWorking,
      @JsonKey(name: 'hourly_wage') required this.hourlyWave,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'confirm_flag') required this.confirmFlag,
      @JsonKey(name: 'payment_status') required this.paymentStatus,
      @JsonKey(name: 'picture_1') required this.picture1,
      @JsonKey(name: 'picture_2') required this.picture2,
      @JsonKey(name: 'picture_3') required this.picture3,
      @JsonKey(name: 'items') required final List<Item> items})
      : _items = items;

  factory _$_Cost.fromJson(Map<String, dynamic> json) => _$$_CostFromJson(json);

  @override
  @JsonKey(name: 'amount_date')
  final String amountDate;
  @override
  @JsonKey(name: 'labour_cost')
  final int labourCost;
  @override
  @JsonKey(name: 'working_time')
  final String workingTime;
  @override
  @JsonKey(name: 'hour_woking')
  final int hourWorking;
  @override
  @JsonKey(name: 'hourly_wage')
  final int hourlyWave;
  @override
  @JsonKey(name: 'amount')
  final int amount;
  @override
  @JsonKey(name: 'confirm_flag')
  final int confirmFlag;
  @override
  @JsonKey(name: 'payment_status')
  final int paymentStatus;
  @override
  @JsonKey(name: 'picture_1')
  final String? picture1;
  @override
  @JsonKey(name: 'picture_2')
  final String? picture2;
  @override
  @JsonKey(name: 'picture_3')
  final String? picture3;
  final List<Item> _items;
  @override
  @JsonKey(name: 'items')
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Cost(amountDate: $amountDate, labourCost: $labourCost, workingTime: $workingTime, hourWorking: $hourWorking, hourlyWave: $hourlyWave, amount: $amount, confirmFlag: $confirmFlag, paymentStatus: $paymentStatus, picture1: $picture1, picture2: $picture2, picture3: $picture3, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cost &&
            (identical(other.amountDate, amountDate) ||
                other.amountDate == amountDate) &&
            (identical(other.labourCost, labourCost) ||
                other.labourCost == labourCost) &&
            (identical(other.workingTime, workingTime) ||
                other.workingTime == workingTime) &&
            (identical(other.hourWorking, hourWorking) ||
                other.hourWorking == hourWorking) &&
            (identical(other.hourlyWave, hourlyWave) ||
                other.hourlyWave == hourlyWave) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.confirmFlag, confirmFlag) ||
                other.confirmFlag == confirmFlag) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.picture1, picture1) ||
                other.picture1 == picture1) &&
            (identical(other.picture2, picture2) ||
                other.picture2 == picture2) &&
            (identical(other.picture3, picture3) ||
                other.picture3 == picture3) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amountDate,
      labourCost,
      workingTime,
      hourWorking,
      hourlyWave,
      amount,
      confirmFlag,
      paymentStatus,
      picture1,
      picture2,
      picture3,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CostCopyWith<_$_Cost> get copyWith =>
      __$$_CostCopyWithImpl<_$_Cost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CostToJson(
      this,
    );
  }
}

abstract class _Cost implements Cost {
  const factory _Cost(
      {@JsonKey(name: 'amount_date') required final String amountDate,
      @JsonKey(name: 'labour_cost') required final int labourCost,
      @JsonKey(name: 'working_time') required final String workingTime,
      @JsonKey(name: 'hour_woking') required final int hourWorking,
      @JsonKey(name: 'hourly_wage') required final int hourlyWave,
      @JsonKey(name: 'amount') required final int amount,
      @JsonKey(name: 'confirm_flag') required final int confirmFlag,
      @JsonKey(name: 'payment_status') required final int paymentStatus,
      @JsonKey(name: 'picture_1') required final String? picture1,
      @JsonKey(name: 'picture_2') required final String? picture2,
      @JsonKey(name: 'picture_3') required final String? picture3,
      @JsonKey(name: 'items') required final List<Item> items}) = _$_Cost;

  factory _Cost.fromJson(Map<String, dynamic> json) = _$_Cost.fromJson;

  @override
  @JsonKey(name: 'amount_date')
  String get amountDate;
  @override
  @JsonKey(name: 'labour_cost')
  int get labourCost;
  @override
  @JsonKey(name: 'working_time')
  String get workingTime;
  @override
  @JsonKey(name: 'hour_woking')
  int get hourWorking;
  @override
  @JsonKey(name: 'hourly_wage')
  int get hourlyWave;
  @override
  @JsonKey(name: 'amount')
  int get amount;
  @override
  @JsonKey(name: 'confirm_flag')
  int get confirmFlag;
  @override
  @JsonKey(name: 'payment_status')
  int get paymentStatus;
  @override
  @JsonKey(name: 'picture_1')
  String? get picture1;
  @override
  @JsonKey(name: 'picture_2')
  String? get picture2;
  @override
  @JsonKey(name: 'picture_3')
  String? get picture3;
  @override
  @JsonKey(name: 'items')
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$_CostCopyWith<_$_Cost> get copyWith => throw _privateConstructorUsedError;
}
