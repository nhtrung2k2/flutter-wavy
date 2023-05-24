// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: 'item_id')
  int get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_amount')
  int get itemAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'option')
  int get option => throw _privateConstructorUsedError;
  @JsonKey(name: 'include_in_payment', nullable: true)
  int? get includeInPayment => throw _privateConstructorUsedError;
  bool get canRemove => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id')
          int itemId,
      @JsonKey(name: 'item_name')
          String itemName,
      @JsonKey(name: 'item_amount')
          int itemAmount,
      @JsonKey(name: 'option')
          int option,
      @JsonKey(name: 'include_in_payment', nullable: true)
          int? includeInPayment,
      bool canRemove});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? itemAmount = null,
    Object? option = null,
    Object? includeInPayment = freezed,
    Object? canRemove = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemAmount: null == itemAmount
          ? _value.itemAmount
          : itemAmount // ignore: cast_nullable_to_non_nullable
              as int,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as int,
      includeInPayment: freezed == includeInPayment
          ? _value.includeInPayment
          : includeInPayment // ignore: cast_nullable_to_non_nullable
              as int?,
      canRemove: null == canRemove
          ? _value.canRemove
          : canRemove // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id')
          int itemId,
      @JsonKey(name: 'item_name')
          String itemName,
      @JsonKey(name: 'item_amount')
          int itemAmount,
      @JsonKey(name: 'option')
          int option,
      @JsonKey(name: 'include_in_payment', nullable: true)
          int? includeInPayment,
      bool canRemove});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? itemAmount = null,
    Object? option = null,
    Object? includeInPayment = freezed,
    Object? canRemove = null,
  }) {
    return _then(_$_Item(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemAmount: null == itemAmount
          ? _value.itemAmount
          : itemAmount // ignore: cast_nullable_to_non_nullable
              as int,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as int,
      includeInPayment: freezed == includeInPayment
          ? _value.includeInPayment
          : includeInPayment // ignore: cast_nullable_to_non_nullable
              as int?,
      canRemove: null == canRemove
          ? _value.canRemove
          : canRemove // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {@JsonKey(name: 'item_id')
          required this.itemId,
      @JsonKey(name: 'item_name')
          this.itemName = '',
      @JsonKey(name: 'item_amount')
          required this.itemAmount,
      @JsonKey(name: 'option')
          this.option = 1,
      @JsonKey(name: 'include_in_payment', nullable: true)
          this.includeInPayment,
      this.canRemove = true});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  @JsonKey(name: 'item_id')
  final int itemId;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  @JsonKey(name: 'item_amount')
  final int itemAmount;
  @override
  @JsonKey(name: 'option')
  final int option;
  @override
  @JsonKey(name: 'include_in_payment', nullable: true)
  final int? includeInPayment;
  @override
  @JsonKey()
  final bool canRemove;

  @override
  String toString() {
    return 'Item(itemId: $itemId, itemName: $itemName, itemAmount: $itemAmount, option: $option, includeInPayment: $includeInPayment, canRemove: $canRemove)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemAmount, itemAmount) ||
                other.itemAmount == itemAmount) &&
            (identical(other.option, option) || other.option == option) &&
            (identical(other.includeInPayment, includeInPayment) ||
                other.includeInPayment == includeInPayment) &&
            (identical(other.canRemove, canRemove) ||
                other.canRemove == canRemove));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, itemName, itemAmount,
      option, includeInPayment, canRemove);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {@JsonKey(name: 'item_id')
          required final int itemId,
      @JsonKey(name: 'item_name')
          final String itemName,
      @JsonKey(name: 'item_amount')
          required final int itemAmount,
      @JsonKey(name: 'option')
          final int option,
      @JsonKey(name: 'include_in_payment', nullable: true)
          final int? includeInPayment,
      final bool canRemove}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  @JsonKey(name: 'item_id')
  int get itemId;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'item_amount')
  int get itemAmount;
  @override
  @JsonKey(name: 'option')
  int get option;
  @override
  @JsonKey(name: 'include_in_payment', nullable: true)
  int? get includeInPayment;
  @override
  bool get canRemove;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
