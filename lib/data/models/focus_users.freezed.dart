// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'focus_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FocusUsers _$FocusUsersFromJson(Map<String, dynamic> json) {
  return _FocusUsers.fromJson(json);
}

/// @nodoc
class _$FocusUsersTearOff {
  const _$FocusUsersTearOff();

  _FocusUsers call({List<FocusUser> items = const [], bool isLoading = true}) {
    return _FocusUsers(
      items: items,
      isLoading: isLoading,
    );
  }

  FocusUsers fromJson(Map<String, Object> json) {
    return FocusUsers.fromJson(json);
  }
}

/// @nodoc
const $FocusUsers = _$FocusUsersTearOff();

/// @nodoc
mixin _$FocusUsers {
  List<FocusUser> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FocusUsersCopyWith<FocusUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusUsersCopyWith<$Res> {
  factory $FocusUsersCopyWith(
          FocusUsers value, $Res Function(FocusUsers) then) =
      _$FocusUsersCopyWithImpl<$Res>;
  $Res call({List<FocusUser> items, bool isLoading});
}

/// @nodoc
class _$FocusUsersCopyWithImpl<$Res> implements $FocusUsersCopyWith<$Res> {
  _$FocusUsersCopyWithImpl(this._value, this._then);

  final FocusUsers _value;
  // ignore: unused_field
  final $Res Function(FocusUsers) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FocusUser>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FocusUsersCopyWith<$Res> implements $FocusUsersCopyWith<$Res> {
  factory _$FocusUsersCopyWith(
          _FocusUsers value, $Res Function(_FocusUsers) then) =
      __$FocusUsersCopyWithImpl<$Res>;
  @override
  $Res call({List<FocusUser> items, bool isLoading});
}

/// @nodoc
class __$FocusUsersCopyWithImpl<$Res> extends _$FocusUsersCopyWithImpl<$Res>
    implements _$FocusUsersCopyWith<$Res> {
  __$FocusUsersCopyWithImpl(
      _FocusUsers _value, $Res Function(_FocusUsers) _then)
      : super(_value, (v) => _then(v as _FocusUsers));

  @override
  _FocusUsers get _value => super._value as _FocusUsers;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_FocusUsers(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FocusUser>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FocusUsers implements _FocusUsers {
  const _$_FocusUsers({this.items = const [], this.isLoading = true});

  factory _$_FocusUsers.fromJson(Map<String, dynamic> json) =>
      _$_$_FocusUsersFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<FocusUser> items;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'FocusUsers(items: $items, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FocusUsers &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(isLoading);

  @JsonKey(ignore: true)
  @override
  _$FocusUsersCopyWith<_FocusUsers> get copyWith =>
      __$FocusUsersCopyWithImpl<_FocusUsers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FocusUsersToJson(this);
  }
}

abstract class _FocusUsers implements FocusUsers {
  const factory _FocusUsers({List<FocusUser> items, bool isLoading}) =
      _$_FocusUsers;

  factory _FocusUsers.fromJson(Map<String, dynamic> json) =
      _$_FocusUsers.fromJson;

  @override
  List<FocusUser> get items => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FocusUsersCopyWith<_FocusUsers> get copyWith =>
      throw _privateConstructorUsedError;
}
