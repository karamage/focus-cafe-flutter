import 'package:focus_cafe_flutter/data/models/focus_time.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_time_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final focusTimeProvider = StateNotifierProvider<FocusTimeNotifier, FocusTime>((ref) =>
    FocusTimeNotifier()
);
