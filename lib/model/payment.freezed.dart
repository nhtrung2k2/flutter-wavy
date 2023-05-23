// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  @JsonKey(name: 'payment_month')
  String get paymentMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'labour_cost')
  int get labourCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'hour_woking')
  int get hourWorking => throw _privateConstructorUsedError;
  @JsonKey(name: 'hourly_wage')
  int get hourlyWage => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_amount')
  int get paymentAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  int get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_month') String paymentMonth,
      @JsonKey(name: 'labour_cost') int labourCost,
      @JsonKey(name: 'hour_woking') int hourWorking,
      @JsonKey(name: 'hourly_wage') int hourlyWage,
      @JsonKey(name: 'payment_amount') int paymentAmount,
      @JsonKey(name: 'payment_status') int paymentStatus,
      @JsonKey(name: 'items') List<Item> items});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMonth = null,
    Object? labourCost = null,
    Object? hourWorking = null,
    Object? hourlyWage = null,
    Object? paymentAmount = null,
    Object? paymentStatus = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      paymentMonth: null == paymentMonth
          ? _value.paymentMonth
          : paymentMonth // ignore: cast_nullable_to_non_nullable
              as String,
      labourCost: null == labourCost
          ? _value.labourCost
          : labourCost // ignore: cast_nullable_to_non_nullable
              as int,
      hourWorking: null == hourWorking
          ? _value.hourWorking
          : hourWorking // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyWage: null == hourlyWage
          ? _value.hourlyWage
          : hourlyWage // ignore: cast_nullable_to_non_nullable
              as int,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as int,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$_PaymentCopyWith(
          _$_Payment value, $Res Function(_$_Payment) then) =
      __$$_PaymentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_month') String paymentMonth,
      @JsonKey(name: 'labour_cost') int labourCost,
      @JsonKey(name: 'hour_woking') int hourWorking,
      @JsonKey(name: 'hourly_wage') int hourlyWage,
      @JsonKey(name: 'payment_amount') int paymentAmount,
      @JsonKey(name: 'payment_status') int paymentStatus,
      @JsonKey(name: 'items') List<Item> items});
}

/// @nodoc
class __$$_PaymentCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$_Payment>
    implements _$$_PaymentCopyWith<$Res> {
  __$$_PaymentCopyWithImpl(_$_Payment _value, $Res Function(_$_Payment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMonth = null,
    Object? labourCost = null,
    Object? hourWorking = null,
    Object? hourlyWage = null,
    Object? paymentAmount = null,
    Object? paymentStatus = null,
    Object? items = null,
  }) {
    return _then(_$_Payment(
      paymentMonth: null == paymentMonth
          ? _value.paymentMonth
          : paymentMonth // ignore: cast_nullable_to_non_nullable
              as String,
      labourCost: null == labourCost
          ? _value.labourCost
          : labourCost // ignore: cast_nullable_to_non_nullable
              as int,
      hourWorking: null == hourWorking
          ? _value.hourWorking
          : hourWorking // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyWage: null == hourlyWage
          ? _value.hourlyWage
          : hourlyWage // ignore: cast_nullable_to_non_nullable
              as int,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as int,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Payment implements _Payment {
  const _$_Payment(
      {@JsonKey(name: 'payment_month') required this.paymentMonth,
      @JsonKey(name: 'labour_cost') required this.labourCost,
      @JsonKey(name: 'hour_woking') required this.hourWorking,
      @JsonKey(name: 'hourly_wage') required this.hourlyWage,
      @JsonKey(name: 'payment_amount') required this.paymentAmount,
      @JsonKey(name: 'payment_status') required this.paymentStatus,
      @JsonKey(name: 'items') required final List<Item> items})
      : _items = items;

  factory _$_Payment.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentFromJson(json);

  @override
  @JsonKey(name: 'payment_month')
  final String paymentMonth;
  @override
  @JsonKey(name: 'labour_cost')
  final int labourCost;
  @override
  @JsonKey(name: 'hour_woking')
  final int hourWorking;
  @override
  @JsonKey(name: 'hourly_wage')
  final int hourlyWage;
  @override
  @JsonKey(name: 'payment_amount')
  final int paymentAmount;
  @override
  @JsonKey(name: 'payment_status')
  final int paymentStatus;
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
    return 'Payment(paymentMonth: $paymentMonth, labourCost: $labourCost, hourWorking: $hourWorking, hourlyWage: $hourlyWage, paymentAmount: $paymentAmount, paymentStatus: $paymentStatus, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Payment &&
            (identical(other.paymentMonth, paymentMonth) ||
                other.paymentMonth == paymentMonth) &&
            (identical(other.labourCost, labourCost) ||
                other.labourCost == labourCost) &&
            (identical(other.hourWorking, hourWorking) ||
                other.hourWorking == hourWorking) &&
            (identical(other.hourlyWage, hourlyWage) ||
                other.hourlyWage == hourlyWage) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentMonth,
      labourCost,
      hourWorking,
      hourlyWage,
      paymentAmount,
      paymentStatus,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentCopyWith<_$_Payment> get copyWith =>
      __$$_PaymentCopyWithImpl<_$_Payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentToJson(
      this,
    );
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      {@JsonKey(name: 'payment_month') required final String paymentMonth,
      @JsonKey(name: 'labour_cost') required final int labourCost,
      @JsonKey(name: 'hour_woking') required final int hourWorking,
      @JsonKey(name: 'hourly_wage') required final int hourlyWage,
      @JsonKey(name: 'payment_amount') required final int paymentAmount,
      @JsonKey(name: 'payment_status') required final int paymentStatus,
      @JsonKey(name: 'items') required final List<Item> items}) = _$_Payment;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$_Payment.fromJson;

  @override
  @JsonKey(name: 'payment_month')
  String get paymentMonth;
  @override
  @JsonKey(name: 'labour_cost')
  int get labourCost;
  @override
  @JsonKey(name: 'hour_woking')
  int get hourWorking;
  @override
  @JsonKey(name: 'hourly_wage')
  int get hourlyWage;
  @override
  @JsonKey(name: 'payment_amount')
  int get paymentAmount;
  @override
  @JsonKey(name: 'payment_status')
  int get paymentStatus;
  @override
  @JsonKey(name: 'items')
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentCopyWith<_$_Payment> get copyWith =>
      throw _privateConstructorUsedError;
}
