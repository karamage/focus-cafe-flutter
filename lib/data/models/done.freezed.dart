// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'done.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Done _$DoneFromJson(Map<String, dynamic> json) {
  return _Done.fromJson(json);
}

/// @nodoc
class _$DoneTearOff {
  const _$DoneTearOff();

  _Done call(
      {String? id,
      DateTime? startDate,
      DateTime? endDate,
      int totalElapsedTime = 0,
      User? user}) {
    return _Done(
      id: id,
      startDate: startDate,
      endDate: endDate,
      totalElapsedTime: totalElapsedTime,
      user: user,
    );
  }

  Done fromJson(Map<String, Object> json) {
    return Done.fromJson(json);
  }
}

/// @nodoc
const $Done = _$DoneTearOff();

/// @nodoc
mixin _$Done {
  String? get id => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  int get totalElapsedTime => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoneCopyWith<Done> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoneCopyWith<$Res> {
  factory $DoneCopyWith(Done value, $Res Function(Done) then) =
      _$DoneCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      DateTime? startDate,
      DateTime? endDate,
      int totalElapsedTime,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$DoneCopyWithImpl<$Res> implements $DoneCopyWith<$Res> {
  _$DoneCopyWithImpl(this._value, this._then);

  final Done _value;
  // ignore: unused_field
  final $Res Function(Done) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalElapsedTime = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalElapsedTime: totalElapsedTime == freezed
          ? _value.totalElapsedTime
          : totalElapsedTime // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$DoneCopyWith<$Res> implements $DoneCopyWith<$Res> {
  factory _$DoneCopyWith(_Done value, $Res Function(_Done) then) =
      __$DoneCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      DateTime? startDate,
      DateTime? endDate,
      int totalElapsedTime,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$DoneCopyWithImpl<$Res> extends _$DoneCopyWithImpl<$Res>
    implements _$DoneCopyWith<$Res> {
  __$DoneCopyWithImpl(_Done _value, $Res Function(_Done) _then)
      : super(_value, (v) => _then(v as _Done));

  @override
  _Done get _value => super._value as _Done;

  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalElapsedTime = freezed,
    Object? user = freezed,
  }) {
    return _then(_Done(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalElapsedTime: totalElapsedTime == freezed
          ? _value.totalElapsedTime
          : totalElapsedTime // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Done implements _Done {
  const _$_Done(
      {this.id,
      this.startDate,
      this.endDate,
      this.totalElapsedTime = 0,
      this.user});

  factory _$_Done.fromJson(Map<String, dynamic> json) =>
      _$_$_DoneFromJson(json);

  @override
  final String? id;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @JsonKey(defaultValue: 0)
  @override
  final int totalElapsedTime;
  @override
  final User? user;

  @override
  String toString() {
    return 'Done(id: $id, startDate: $startDate, endDate: $endDate, totalElapsedTime: $totalElapsedTime, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Done &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.totalElapsedTime, totalElapsedTime) ||
                const DeepCollectionEquality()
                    .equals(other.totalElapsedTime, totalElapsedTime)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(totalElapsedTime) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$DoneCopyWith<_Done> get copyWith =>
      __$DoneCopyWithImpl<_Done>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DoneToJson(this);
  }
}

abstract class _Done implements Done {
  const factory _Done(
      {String? id,
      DateTime? startDate,
      DateTime? endDate,
      int totalElapsedTime,
      User? user}) = _$_Done;

  factory _Done.fromJson(Map<String, dynamic> json) = _$_Done.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override
  DateTime? get endDate => throw _privateConstructorUsedError;
  @override
  int get totalElapsedTime => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DoneCopyWith<_Done> get copyWith => throw _privateConstructorUsedError;
}
