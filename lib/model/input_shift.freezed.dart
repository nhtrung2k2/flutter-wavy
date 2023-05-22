// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InputShift _$InputShiftFromJson(Map<String, dynamic> json) {
  return _InputShift.fromJson(json);
}

/// @nodoc
mixin _$InputShift {
  @JsonKey(name: 'from')
  String get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'to')
  String get to => throw _privateConstructorUsedError;
  @JsonKey(name: 'not_available')
  bool get notAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InputShiftCopyWith<InputShift> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputShiftCopyWith<$Res> {
  factory $InputShiftCopyWith(
          InputShift value, $Res Function(InputShift) then) =
      _$InputShiftCopyWithImpl<$Res, InputShift>;
  @useResult
  $Res call(
      {@JsonKey(name: 'from') String from,
      @JsonKey(name: 'to') String to,
      @JsonKey(name: 'not_available') bool notAvailable});
}

/// @nodoc
class _$InputShiftCopyWithImpl<$Res, $Val extends InputShift>
    implements $InputShiftCopyWith<$Res> {
  _$InputShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? notAvailable = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      notAvailable: null == notAvailable
          ? _value.notAvailable
          : notAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InputShiftCopyWith<$Res>
    implements $InputShiftCopyWith<$Res> {
  factory _$$_InputShiftCopyWith(
          _$_InputShift value, $Res Function(_$_InputShift) then) =
      __$$_InputShiftCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'from') String from,
      @JsonKey(name: 'to') String to,
      @JsonKey(name: 'not_available') bool notAvailable});
}

/// @nodoc
class __$$_InputShiftCopyWithImpl<$Res>
    extends _$InputShiftCopyWithImpl<$Res, _$_InputShift>
    implements _$$_InputShiftCopyWith<$Res> {
  __$$_InputShiftCopyWithImpl(
      _$_InputShift _value, $Res Function(_$_InputShift) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? notAvailable = null,
  }) {
    return _then(_$_InputShift(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      notAvailable: null == notAvailable
          ? _value.notAvailable
          : notAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InputShift implements _InputShift {
  const _$_InputShift(
      {@JsonKey(name: 'from') required this.from,
      @JsonKey(name: 'to') required this.to,
      @JsonKey(name: 'not_available') required this.notAvailable});

  factory _$_InputShift.fromJson(Map<String, dynamic> json) =>
      _$$_InputShiftFromJson(json);

  @override
  @JsonKey(name: 'from')
  final String from;
  @override
  @JsonKey(name: 'to')
  final String to;
  @override
  @JsonKey(name: 'not_available')
  final bool notAvailable;

  @override
  String toString() {
    return 'InputShift(from: $from, to: $to, notAvailable: $notAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InputShift &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.notAvailable, notAvailable) ||
                other.notAvailable == notAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, notAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InputShiftCopyWith<_$_InputShift> get copyWith =>
      __$$_InputShiftCopyWithImpl<_$_InputShift>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InputShiftToJson(
      this,
    );
  }
}

abstract class _InputShift implements InputShift {
  const factory _InputShift(
          {@JsonKey(name: 'from') required final String from,
          @JsonKey(name: 'to') required final String to,
          @JsonKey(name: 'not_available') required final bool notAvailable}) =
      _$_InputShift;

  factory _InputShift.fromJson(Map<String, dynamic> json) =
      _$_InputShift.fromJson;

  @override
  @JsonKey(name: 'from')
  String get from;
  @override
  @JsonKey(name: 'to')
  String get to;
  @override
  @JsonKey(name: 'not_available')
  bool get notAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_InputShiftCopyWith<_$_InputShift> get copyWith =>
      throw _privateConstructorUsedError;
}
