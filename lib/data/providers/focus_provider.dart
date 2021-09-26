import 'package:focus_cafe_flutter/data/models/focus.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final focusProvider = StateNotifierProvider<FocusNotifier, Focus>((ref) =>
    FocusNotifier()
);
