import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/providers/activity_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/activity_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final activityProvider = StateNotifierProvider.autoDispose<ActivityNotifier, Activity>((ref) =>
  ActivityNotifier(repository:ref.read(activityRepositoryProvider))
);
