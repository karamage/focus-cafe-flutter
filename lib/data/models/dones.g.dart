// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dones _$_$_DonesFromJson(Map<String, dynamic> json) {
  return _$_Dones(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Done.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    isLoading: json['isLoading'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_DonesToJson(_$_Dones instance) => <String, dynamic>{
      'items': instance.items,
      'isLoading': instance.isLoading,
    };
