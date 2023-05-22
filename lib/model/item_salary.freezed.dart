// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_salary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemSalary _$ItemSalaryFromJson(Map<String, dynamic> json) {
  return _ItemSalary.fromJson(json);
}

/// @nodoc
mixin _$ItemSalary {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'option')
  int get option => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemSalaryCopyWith<ItemSalary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemSalaryCopyWith<$Res> {
  factory $ItemSalaryCopyWith(
          ItemSalary value, $Res Function(ItemSalary) then) =
      _$ItemSalaryCopyWithImpl<$Res, ItemSalary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'option') int option});
}

/// @nodoc
class _$ItemSalaryCopyWithImpl<$Res, $Val extends ItemSalary>
    implements $ItemSalaryCopyWith<$Res> {
  _$ItemSalaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? option = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemSalaryCopyWith<$Res>
    implements $ItemSalaryCopyWith<$Res> {
  factory _$$_ItemSalaryCopyWith(
          _$_ItemSalary value, $Res Function(_$_ItemSalary) then) =
      __$$_ItemSalaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'option') int option});
}

/// @nodoc
class __$$_ItemSalaryCopyWithImpl<$Res>
    extends _$ItemSalaryCopyWithImpl<$Res, _$_ItemSalary>
    implements _$$_ItemSalaryCopyWith<$Res> {
  __$$_ItemSalaryCopyWithImpl(
      _$_ItemSalary _value, $Res Function(_$_ItemSalary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? option = null,
  }) {
    return _then(_$_ItemSalary(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemSalary implements _ItemSalary {
  const _$_ItemSalary(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'option') required this.option});

  factory _$_ItemSalary.fromJson(Map<String, dynamic> json) =>
      _$$_ItemSalaryFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey(name: 'option')
  final int option;

  @override
  String toString() {
    return 'ItemSalary(id: $id, price: $price, option: $option)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemSalary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.option, option) || other.option == option));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, price, option);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemSalaryCopyWith<_$_ItemSalary> get copyWith =>
      __$$_ItemSalaryCopyWithImpl<_$_ItemSalary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemSalaryToJson(
      this,
    );
  }
}

abstract class _ItemSalary implements ItemSalary {
  const factory _ItemSalary(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'price') required final int price,
      @JsonKey(name: 'option') required final int option}) = _$_ItemSalary;

  factory _ItemSalary.fromJson(Map<String, dynamic> json) =
      _$_ItemSalary.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(name: 'option')
  int get option;
  @override
  @JsonKey(ignore: true)
  _$$_ItemSalaryCopyWith<_$_ItemSalary> get copyWith =>
      throw _privateConstructorUsedError;
}
