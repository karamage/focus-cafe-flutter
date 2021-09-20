// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'dones.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dones _$DonesFromJson(Map<String, dynamic> json) {
  return _Dones.fromJson(json);
}

/// @nodoc
class _$DonesTearOff {
  const _$DonesTearOff();

  _Dones call({List<Done> items = const [], bool isLoading = true}) {
    return _Dones(
      items: items,
      isLoading: isLoading,
    );
  }

  Dones fromJson(Map<String, Object> json) {
    return Dones.fromJson(json);
  }
}

/// @nodoc
const $Dones = _$DonesTearOff();

/// @nodoc
mixin _$Dones {
  List<Done> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonesCopyWith<Dones> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonesCopyWith<$Res> {
  factory $DonesCopyWith(Dones value, $Res Function(Dones) then) =
      _$DonesCopyWithImpl<$Res>;
  $Res call({List<Done> items, bool isLoading});
}

/// @nodoc
class _$DonesCopyWithImpl<$Res> implements $DonesCopyWith<$Res> {
  _$DonesCopyWithImpl(this._value, this._then);

  final Dones _value;
  // ignore: unused_field
  final $Res Function(Dones) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Done>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$DonesCopyWith<$Res> implements $DonesCopyWith<$Res> {
  factory _$DonesCopyWith(_Dones value, $Res Function(_Dones) then) =
      __$DonesCopyWithImpl<$Res>;
  @override
  $Res call({List<Done> items, bool isLoading});
}

/// @nodoc
class __$DonesCopyWithImpl<$Res> extends _$DonesCopyWithImpl<$Res>
    implements _$DonesCopyWith<$Res> {
  __$DonesCopyWithImpl(_Dones _value, $Res Function(_Dones) _then)
      : super(_value, (v) => _then(v as _Dones));

  @override
  _Dones get _value => super._value as _Dones;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_Dones(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Done>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dones implements _Dones {
  const _$_Dones({this.items = const [], this.isLoading = true});

  factory _$_Dones.fromJson(Map<String, dynamic> json) =>
      _$_$_DonesFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<Done> items;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'Dones(items: $items, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Dones &&
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
  _$DonesCopyWith<_Dones> get copyWith =>
      __$DonesCopyWithImpl<_Dones>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DonesToJson(this);
  }
}

abstract class _Dones implements Dones {
  const factory _Dones({List<Done> items, bool isLoading}) = _$_Dones;

  factory _Dones.fromJson(Map<String, dynamic> json) = _$_Dones.fromJson;

  @override
  List<Done> get items => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DonesCopyWith<_Dones> get copyWith => throw _privateConstructorUsedError;
}
