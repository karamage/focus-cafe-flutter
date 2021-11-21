import 'package:focus_cafe_flutter/data/models/rest_time.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_time_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final restTimeProvider = StateNotifierProvider<RestTimeNotifier, RestTime>((ref) =>
    RestTimeNotifier()
);
