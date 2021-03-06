// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String? id,
      String name = "",
      String desc = "",
      String photoUrl = "",
      int totalPoint = 0,
      int totalLikedCount = 0,
      int unreadCount = 0,
      bool isAnonymous = false}) {
    return _User(
      id: id,
      name: name,
      desc: desc,
      photoUrl: photoUrl,
      totalPoint: totalPoint,
      totalLikedCount: totalLikedCount,
      unreadCount: unreadCount,
      isAnonymous: isAnonymous,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  int get totalPoint => throw _privateConstructorUsedError;
  int get totalLikedCount => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  bool get isAnonymous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String desc,
      String photoUrl,
      int totalPoint,
      int totalLikedCount,
      int unreadCount,
      bool isAnonymous});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? desc = freezed,
    Object? photoUrl = freezed,
    Object? totalPoint = freezed,
    Object? totalLikedCount = freezed,
    Object? unreadCount = freezed,
    Object? isAnonymous = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoint: totalPoint == freezed
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int,
      totalLikedCount: totalLikedCount == freezed
          ? _value.totalLikedCount
          : totalLikedCount // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      isAnonymous: isAnonymous == freezed
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String desc,
      String photoUrl,
      int totalPoint,
      int totalLikedCount,
      int unreadCount,
      bool isAnonymous});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? desc = freezed,
    Object? photoUrl = freezed,
    Object? totalPoint = freezed,
    Object? totalLikedCount = freezed,
    Object? unreadCount = freezed,
    Object? isAnonymous = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoint: totalPoint == freezed
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int,
      totalLikedCount: totalLikedCount == freezed
          ? _value.totalLikedCount
          : totalLikedCount // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      isAnonymous: isAnonymous == freezed
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.id,
      this.name = "",
      this.desc = "",
      this.photoUrl = "",
      this.totalPoint = 0,
      this.totalLikedCount = 0,
      this.unreadCount = 0,
      this.isAnonymous = false});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String? id;
  @JsonKey(defaultValue: "")
  @override
  final String name;
  @JsonKey(defaultValue: "")
  @override
  final String desc;
  @JsonKey(defaultValue: "")
  @override
  final String photoUrl;
  @JsonKey(defaultValue: 0)
  @override
  final int totalPoint;
  @JsonKey(defaultValue: 0)
  @override
  final int totalLikedCount;
  @JsonKey(defaultValue: 0)
  @override
  final int unreadCount;
  @JsonKey(defaultValue: false)
  @override
  final bool isAnonymous;

  @override
  String toString() {
    return 'User(id: $id, name: $name, desc: $desc, photoUrl: $photoUrl, totalPoint: $totalPoint, totalLikedCount: $totalLikedCount, unreadCount: $unreadCount, isAnonymous: $isAnonymous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.totalPoint, totalPoint) ||
                const DeepCollectionEquality()
                    .equals(other.totalPoint, totalPoint)) &&
            (identical(other.totalLikedCount, totalLikedCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalLikedCount, totalLikedCount)) &&
            (identical(other.unreadCount, unreadCount) ||
                const DeepCollectionEquality()
                    .equals(other.unreadCount, unreadCount)) &&
            (identical(other.isAnonymous, isAnonymous) ||
                const DeepCollectionEquality()
                    .equals(other.isAnonymous, isAnonymous)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(desc) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(totalPoint) ^
      const DeepCollectionEquality().hash(totalLikedCount) ^
      const DeepCollectionEquality().hash(unreadCount) ^
      const DeepCollectionEquality().hash(isAnonymous);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {String? id,
      String name,
      String desc,
      String photoUrl,
      int totalPoint,
      int totalLikedCount,
      int unreadCount,
      bool isAnonymous}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get desc => throw _privateConstructorUsedError;
  @override
  String get photoUrl => throw _privateConstructorUsedError;
  @override
  int get totalPoint => throw _privateConstructorUsedError;
  @override
  int get totalLikedCount => throw _privateConstructorUsedError;
  @override
  int get unreadCount => throw _privateConstructorUsedError;
  @override
  bool get isAnonymous => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
