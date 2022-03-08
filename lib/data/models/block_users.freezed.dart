// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'block_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlockUsers _$BlockUsersFromJson(Map<String, dynamic> json) {
  return _BlockUsers.fromJson(json);
}

/// @nodoc
class _$BlockUsersTearOff {
  const _$BlockUsersTearOff();

  _BlockUsers call({List<BlockUser> items = const [], bool isLoading = true}) {
    return _BlockUsers(
      items: items,
      isLoading: isLoading,
    );
  }

  BlockUsers fromJson(Map<String, Object> json) {
    return BlockUsers.fromJson(json);
  }
}

/// @nodoc
const $BlockUsers = _$BlockUsersTearOff();

/// @nodoc
mixin _$BlockUsers {
  List<BlockUser> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockUsersCopyWith<BlockUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockUsersCopyWith<$Res> {
  factory $BlockUsersCopyWith(
          BlockUsers value, $Res Function(BlockUsers) then) =
      _$BlockUsersCopyWithImpl<$Res>;
  $Res call({List<BlockUser> items, bool isLoading});
}

/// @nodoc
class _$BlockUsersCopyWithImpl<$Res> implements $BlockUsersCopyWith<$Res> {
  _$BlockUsersCopyWithImpl(this._value, this._then);

  final BlockUsers _value;
  // ignore: unused_field
  final $Res Function(BlockUsers) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BlockUser>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BlockUsersCopyWith<$Res> implements $BlockUsersCopyWith<$Res> {
  factory _$BlockUsersCopyWith(
          _BlockUsers value, $Res Function(_BlockUsers) then) =
      __$BlockUsersCopyWithImpl<$Res>;
  @override
  $Res call({List<BlockUser> items, bool isLoading});
}

/// @nodoc
class __$BlockUsersCopyWithImpl<$Res> extends _$BlockUsersCopyWithImpl<$Res>
    implements _$BlockUsersCopyWith<$Res> {
  __$BlockUsersCopyWithImpl(
      _BlockUsers _value, $Res Function(_BlockUsers) _then)
      : super(_value, (v) => _then(v as _BlockUsers));

  @override
  _BlockUsers get _value => super._value as _BlockUsers;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_BlockUsers(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BlockUser>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BlockUsers implements _BlockUsers {
  const _$_BlockUsers({this.items = const [], this.isLoading = true});

  factory _$_BlockUsers.fromJson(Map<String, dynamic> json) =>
      _$_$_BlockUsersFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<BlockUser> items;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'BlockUsers(items: $items, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BlockUsers &&
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
  _$BlockUsersCopyWith<_BlockUsers> get copyWith =>
      __$BlockUsersCopyWithImpl<_BlockUsers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BlockUsersToJson(this);
  }
}

abstract class _BlockUsers implements BlockUsers {
  const factory _BlockUsers({List<BlockUser> items, bool isLoading}) =
      _$_BlockUsers;

  factory _BlockUsers.fromJson(Map<String, dynamic> json) =
      _$_BlockUsers.fromJson;

  @override
  List<BlockUser> get items => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BlockUsersCopyWith<_BlockUsers> get copyWith =>
      throw _privateConstructorUsedError;
}
