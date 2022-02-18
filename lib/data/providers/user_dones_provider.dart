import 'package:focus_cafe_flutter/data/models/dones.dart';
import 'package:focus_cafe_flutter/data/providers/done_repository_provider.dart';
import 'package:focus_cafe_flutter/data/providers/notification_repository_provider.dart';
import 'package:focus_cafe_flutter/data/providers/user_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/dones_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userDonesProvider = StateNotifierProvider.autoDispose.family<DonesNotifier, Dones, String>((ref, userId) =>
    DonesNotifier(
      ref.read(doneRepositoryProvider),
      ref.read(notificationRepositoryProvider),
      ref.read(userRepositoryProvider),
      userId
    )
);
