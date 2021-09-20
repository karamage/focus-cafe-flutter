import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dones.freezed.dart';
part 'dones.g.dart';

@freezed
abstract class Dones with _$Dones{
  const factory Dones({
    @Default([]) List<Done> items,
    @Default(true) bool isLoading,
  }) = _Dones;
  factory Dones.fromJson(Map<String, dynamic> json) => _$DonesFromJson(json);
}
