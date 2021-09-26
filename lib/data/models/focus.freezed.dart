// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'focus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FocusTearOff {
  const _$FocusTearOff();

  _Focus call(
      {bool isFocus = false,
      int focusTime = INIT_FOCUS_TIME_SEC,
      DateTime? startDate = null,
      bool isRest = false}) {
    return _Focus(
      isFocus: isFocus,
      focusTime: focusTime,
      startDate: startDate,
      isRest: isRest,
    );
  }
}

/// @nodoc
const $Focus = _$FocusTearOff();

/// @nodoc
mixin _$Focus {
  bool get isFocus => throw _privateConstructorUsedError;
  int get focusTime => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  bool get isRest => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FocusCopyWith<Focus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusCopyWith<$Res> {
  factory $FocusCopyWith(Focus value, $Res Function(Focus) then) =
      _$FocusCopyWithImpl<$Res>;
  $Res call({bool isFocus, int focusTime, DateTime? startDate, bool isRest});
}

/// @nodoc
class _$FocusCopyWithImpl<$Res> implements $FocusCopyWith<$Res> {
  _$FocusCopyWithImpl(this._value, this._then);

  final Focus _value;
  // ignore: unused_field
  final $Res Function(Focus) _then;

  @override
  $Res call({
    Object? isFocus = freezed,
    Object? focusTime = freezed,
    Object? startDate = freezed,
    Object? isRest = freezed,
  }) {
    return _then(_value.copyWith(
      isFocus: isFocus == freezed
          ? _value.isFocus
          : isFocus // ignore: cast_nullable_to_non_nullable
              as bool,
      focusTime: focusTime == freezed
          ? _value.focusTime
          : focusTime // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRest: isRest == freezed
          ? _value.isRest
          : isRest // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FocusCopyWith<$Res> implements $FocusCopyWith<$Res> {
  factory _$FocusCopyWith(_Focus value, $Res Function(_Focus) then) =
      __$FocusCopyWithImpl<$Res>;
  @override
  $Res call({bool isFocus, int focusTime, DateTime? startDate, bool isRest});
}

/// @nodoc
class __$FocusCopyWithImpl<$Res> extends _$FocusCopyWithImpl<$Res>
    implements _$FocusCopyWith<$Res> {
  __$FocusCopyWithImpl(_Focus _value, $Res Function(_Focus) _then)
      : super(_value, (v) => _then(v as _Focus));

  @override
  _Focus get _value => super._value as _Focus;

  @override
  $Res call({
    Object? isFocus = freezed,
    Object? focusTime = freezed,
    Object? startDate = freezed,
    Object? isRest = freezed,
  }) {
    return _then(_Focus(
      isFocus: isFocus == freezed
          ? _value.isFocus
          : isFocus // ignore: cast_nullable_to_non_nullable
              as bool,
      focusTime: focusTime == freezed
          ? _value.focusTime
          : focusTime // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRest: isRest == freezed
          ? _value.isRest
          : isRest // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Focus implements _Focus {
  const _$_Focus(
      {this.isFocus = false,
      this.focusTime = INIT_FOCUS_TIME_SEC,
      this.startDate = null,
      this.isRest = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isFocus;
  @JsonKey(defaultValue: INIT_FOCUS_TIME_SEC)
  @override
  final int focusTime;
  @JsonKey(defaultValue: null)
  @override
  final DateTime? startDate;
  @JsonKey(defaultValue: false)
  @override
  final bool isRest;

  @override
  String toString() {
    return 'Focus(isFocus: $isFocus, focusTime: $focusTime, startDate: $startDate, isRest: $isRest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Focus &&
            (identical(other.isFocus, isFocus) ||
                const DeepCollectionEquality()
                    .equals(other.isFocus, isFocus)) &&
            (identical(other.focusTime, focusTime) ||
                const DeepCollectionEquality()
                    .equals(other.focusTime, focusTime)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.isRest, isRest) ||
                const DeepCollectionEquality().equals(other.isRest, isRest)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isFocus) ^
      const DeepCollectionEquality().hash(focusTime) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(isRest);

  @JsonKey(ignore: true)
  @override
  _$FocusCopyWith<_Focus> get copyWith =>
      __$FocusCopyWithImpl<_Focus>(this, _$identity);
}

abstract class _Focus implements Focus {
  const factory _Focus(
      {bool isFocus,
      int focusTime,
      DateTime? startDate,
      bool isRest}) = _$_Focus;

  @override
  bool get isFocus => throw _privateConstructorUsedError;
  @override
  int get focusTime => throw _privateConstructorUsedError;
  @override
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override
  bool get isRest => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FocusCopyWith<_Focus> get copyWith => throw _privateConstructorUsedError;
}
