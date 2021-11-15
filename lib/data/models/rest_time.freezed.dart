// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'rest_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestTimeTearOff {
  const _$RestTimeTearOff();

  _RestTime call({int remainingTime = 0, Timer? timer}) {
    return _RestTime(
      remainingTime: remainingTime,
      timer: timer,
    );
  }
}

/// @nodoc
const $RestTime = _$RestTimeTearOff();

/// @nodoc
mixin _$RestTime {
  int get remainingTime => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestTimeCopyWith<RestTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestTimeCopyWith<$Res> {
  factory $RestTimeCopyWith(RestTime value, $Res Function(RestTime) then) =
      _$RestTimeCopyWithImpl<$Res>;
  $Res call({int remainingTime, Timer? timer});
}

/// @nodoc
class _$RestTimeCopyWithImpl<$Res> implements $RestTimeCopyWith<$Res> {
  _$RestTimeCopyWithImpl(this._value, this._then);

  final RestTime _value;
  // ignore: unused_field
  final $Res Function(RestTime) _then;

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
abstract class _$RestTimeCopyWith<$Res> implements $RestTimeCopyWith<$Res> {
  factory _$RestTimeCopyWith(_RestTime value, $Res Function(_RestTime) then) =
      __$RestTimeCopyWithImpl<$Res>;
  @override
  $Res call({int remainingTime, Timer? timer});
}

/// @nodoc
class __$RestTimeCopyWithImpl<$Res> extends _$RestTimeCopyWithImpl<$Res>
    implements _$RestTimeCopyWith<$Res> {
  __$RestTimeCopyWithImpl(_RestTime _value, $Res Function(_RestTime) _then)
      : super(_value, (v) => _then(v as _RestTime));

  @override
  _RestTime get _value => super._value as _RestTime;

  @override
  $Res call({
    Object? remainingTime = freezed,
    Object? timer = freezed,
  }) {
    return _then(_RestTime(
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

class _$_RestTime implements _RestTime {
  const _$_RestTime({this.remainingTime = 0, this.timer});

  @JsonKey(defaultValue: 0)
  @override
  final int remainingTime;
  @override
  final Timer? timer;

  @override
  String toString() {
    return 'RestTime(remainingTime: $remainingTime, timer: $timer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestTime &&
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
  _$RestTimeCopyWith<_RestTime> get copyWith =>
      __$RestTimeCopyWithImpl<_RestTime>(this, _$identity);
}

abstract class _RestTime implements RestTime {
  const factory _RestTime({int remainingTime, Timer? timer}) = _$_RestTime;

  @override
  int get remainingTime => throw _privateConstructorUsedError;
  @override
  Timer? get timer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RestTimeCopyWith<_RestTime> get copyWith =>
      throw _privateConstructorUsedError;
}
