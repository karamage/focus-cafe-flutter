import 'package:focus_cafe_flutter/data/models/dones.dart';
import 'package:focus_cafe_flutter/data/providers/done_repository_provider.dart';
import 'package:focus_cafe_flutter/data/providers/notification_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/our_dones_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ourDonesProvider = StateNotifierProvider.autoDispose<OurDonesNotifier, Dones>((ref) =>
    OurDonesNotifier(
      ref.read(doneRepositoryProvider),
      ref.read(notificationRepositoryProvider),
    )
);
