// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'focus_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FocusTimeTearOff {
  const _$FocusTimeTearOff();

  _FocusTime call({int remainingTime = 0, Timer? timer}) {
    return _FocusTime(
      remainingTime: remainingTime,
      timer: timer,
    );
  }
}

/// @nodoc
const $FocusTime = _$FocusTimeTearOff();

/// @nodoc
mixin _$FocusTime {
  int get remainingTime => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FocusTimeCopyWith<FocusTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusTimeCopyWith<$Res> {
  factory $FocusTimeCopyWith(FocusTime value, $Res Function(FocusTime) then) =
      _$FocusTimeCopyWithImpl<$Res>;
  $Res call({int remainingTime, Timer? timer});
}

/// @nodoc
class _$FocusTimeCopyWithImpl<$Res> implements $FocusTimeCopyWith<$Res> {
  _$FocusTimeCopyWithImpl(this._value, this._then);

  final FocusTime _value;
  // ignore: unused_field
  final $Res Function(FocusTime) _then;

  @override
  $Res call({
    Object? remainingTime = freezed,
    Object? timer = freezed,
  }) {
    return _then(_value.copyWith(
      remainingTime: remainingTime == freezed
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ));
  }
}

/// @nodoc
abstract class _$FocusTimeCopyWith<$Res> implements $FocusTimeCopyWith<$Res> {
  factory _$FocusTimeCopyWith(
          _FocusTime value, $Res Function(_FocusTime) then) =
      __$FocusTimeCopyWithImpl<$Res>;
  @override
  $Res call({int remainingTime, Timer? timer});
}

/// @nodoc
class __$FocusTimeCopyWithImpl<$Res> extends _$FocusTimeCopyWithImpl<$Res>
    implements _$FocusTimeCopyWith<$Res> {
  __$FocusTimeCopyWithImpl(_FocusTime _value, $Res Function(_FocusTime) _then)
      : super(_value, (v) => _then(v as _FocusTime));

  @override
  _FocusTime get _value => super._value as _FocusTime;

  @override
  $Res call({
    Object? remainingTime = freezed,
    Object? timer = freezed,
  }) {
    return _then(_FocusTime(
      remainingTime: remainingTime == freezed
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ));
  }
}

/// @nodoc

class _$_FocusTime implements _FocusTime {
  const _$_FocusTime({this.remainingTime = 0, this.timer});

  @JsonKey(defaultValue: 0)
  @override
  final int remainingTime;
  @override
  final Timer? timer;

  @override
  String toString() {
    return 'FocusTime(remainingTime: $remainingTime, timer: $timer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FocusTime &&
            (identical(other.remainingTime, remainingTime) ||
                const DeepCollectionEquality()
                    .equals(other.remainingTime, remainingTime)) &&
            (identical(other.timer, timer) ||
                const DeepCollectionEquality().equals(other.timer, timer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(remainingTime) ^
      const DeepCollectionEquality().hash(timer);

  @JsonKey(ignore: true)
  @override
  _$FocusTimeCopyWith<_FocusTime> get copyWith =>
      __$FocusTimeCopyWithImpl<_FocusTime>(this, _$identity);
}

abstract class _FocusTime implements FocusTime {
  const factory _FocusTime({int remainingTime, Timer? timer}) = _$_FocusTime;

  @override
  int get remainingTime => throw _privateConstructorUsedError;
  @override
  Timer? get timer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FocusTimeCopyWith<_FocusTime> get copyWith =>
      throw _privateConstructorUsedError;
}
