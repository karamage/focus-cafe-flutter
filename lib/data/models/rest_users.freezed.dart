// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'rest_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestUsers _$RestUsersFromJson(Map<String, dynamic> json) {
  return _RestUsers.fromJson(json);
}

/// @nodoc
class _$RestUsersTearOff {
  const _$RestUsersTearOff();

  _RestUsers call({List<RestUser> items = const [], bool isLoading = true}) {
    return _RestUsers(
      items: items,
      isLoading: isLoading,
    );
  }

  RestUsers fromJson(Map<String, Object> json) {
    return RestUsers.fromJson(json);
  }
}

/// @nodoc
const $RestUsers = _$RestUsersTearOff();

/// @nodoc
mixin _$RestUsers {
  List<RestUser> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestUsersCopyWith<RestUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestUsersCopyWith<$Res> {
  factory $RestUsersCopyWith(RestUsers value, $Res Function(RestUsers) then) =
      _$RestUsersCopyWithImpl<$Res>;
  $Res call({List<RestUser> items, bool isLoading});
}

/// @nodoc
class _$RestUsersCopyWithImpl<$Res> implements $RestUsersCopyWith<$Res> {
  _$RestUsersCopyWithImpl(this._value, this._then);

  final RestUsers _value;
  // ignore: unused_field
  final $Res Function(RestUsers) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RestUser>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RestUsersCopyWith<$Res> implements $RestUsersCopyWith<$Res> {
  factory _$RestUsersCopyWith(
          _RestUsers value, $Res Function(_RestUsers) then) =
      __$RestUsersCopyWithImpl<$Res>;
  @override
  $Res call({List<RestUser> items, bool isLoading});
}

/// @nodoc
class __$RestUsersCopyWithImpl<$Res> extends _$RestUsersCopyWithImpl<$Res>
    implements _$RestUsersCopyWith<$Res> {
  __$RestUsersCopyWithImpl(_RestUsers _value, $Res Function(_RestUsers) _then)
      : super(_value, (v) => _then(v as _RestUsers));

  @override
  _RestUsers get _value => super._value as _RestUsers;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_RestUsers(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RestUser>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestUsers implements _RestUsers {
  const _$_RestUsers({this.items = const [], this.isLoading = true});

  factory _$_RestUsers.fromJson(Map<String, dynamic> json) =>
      _$_$_RestUsersFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<RestUser> items;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'RestUsers(items: $items, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestUsers &&
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
  _$RestUsersCopyWith<_RestUsers> get copyWith =>
      __$RestUsersCopyWithImpl<_RestUsers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RestUsersToJson(this);
  }
}

abstract class _RestUsers implements RestUsers {
  const factory _RestUsers({List<RestUser> items, bool isLoading}) =
      _$_RestUsers;

  factory _RestUsers.fromJson(Map<String, dynamic> json) =
      _$_RestUsers.fromJson;

  @override
  List<RestUser> get items => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RestUsersCopyWith<_RestUsers> get copyWith =>
      throw _privateConstructorUsedError;
}
