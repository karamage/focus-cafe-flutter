// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
class _$ActivityTearOff {
  const _$ActivityTearOff();

  _Activity call({List<DateTime> dates = const [], int continuedDateNum = 0}) {
    return _Activity(
      dates: dates,
      continuedDateNum: continuedDateNum,
    );
  }

  Activity fromJson(Map<String, Object> json) {
    return Activity.fromJson(json);
  }
}

/// @nodoc
const $Activity = _$ActivityTearOff();

/// @nodoc
mixin _$Activity {
  List<DateTime> get dates => throw _privateConstructorUsedError;
  int get continuedDateNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res>;
  $Res call({List<DateTime> dates, int continuedDateNum});
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res> implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  final Activity _value;
  // ignore: unused_field
  final $Res Function(Activity) _then;

  @override
  $Res call({
    Object? dates = freezed,
    Object? continuedDateNum = freezed,
  }) {
    return _then(_value.copyWith(
      dates: dates == freezed
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      continuedDateNum: continuedDateNum == freezed
          ? _value.continuedDateNum
          : continuedDateNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$ActivityCopyWith(_Activity value, $Res Function(_Activity) then) =
      __$ActivityCopyWithImpl<$Res>;
  @override
  $Res call({List<DateTime> dates, int continuedDateNum});
}

/// @nodoc
class __$ActivityCopyWithImpl<$Res> extends _$ActivityCopyWithImpl<$Res>
    implements _$ActivityCopyWith<$Res> {
  __$ActivityCopyWithImpl(_Activity _value, $Res Function(_Activity) _then)
      : super(_value, (v) => _then(v as _Activity));

  @override
  _Activity get _value => super._value as _Activity;

  @override
  $Res call({
    Object? dates = freezed,
    Object? continuedDateNum = freezed,
  }) {
    return _then(_Activity(
      dates: dates == freezed
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      continuedDateNum: continuedDateNum == freezed
          ? _value.continuedDateNum
          : continuedDateNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Activity implements _Activity {
  const _$_Activity({this.dates = const [], this.continuedDateNum = 0});

  factory _$_Activity.fromJson(Map<String, dynamic> json) =>
      _$_$_ActivityFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<DateTime> dates;
  @JsonKey(defaultValue: 0)
  @override
  final int continuedDateNum;

  @override
  String toString() {
    return 'Activity(dates: $dates, continuedDateNum: $continuedDateNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Activity &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)) &&
            (identical(other.continuedDateNum, continuedDateNum) ||
                const DeepCollectionEquality()
                    .equals(other.continuedDateNum, continuedDateNum)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dates) ^
      const DeepCollectionEquality().hash(continuedDateNum);

  @JsonKey(ignore: true)
  @override
  _$ActivityCopyWith<_Activity> get copyWith =>
      __$ActivityCopyWithImpl<_Activity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ActivityToJson(this);
  }
}

abstract class _Activity implements Activity {
  const factory _Activity({List<DateTime> dates, int continuedDateNum}) =
      _$_Activity;

  factory _Activity.fromJson(Map<String, dynamic> json) = _$_Activity.fromJson;

  @override
  List<DateTime> get dates => throw _privateConstructorUsedError;
  @override
  int get continuedDateNum => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ActivityCopyWith<_Activity> get copyWith =>
      throw _privateConstructorUsedError;
}
