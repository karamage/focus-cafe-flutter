import 'package:focus_cafe_flutter/data/models/focus_users.dart';
import 'package:focus_cafe_flutter/data/providers/focus_user_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_users_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final focusUsersProvider = StateNotifierProvider.autoDispose<FocusUsersNotifier, FocusUsers>((ref) =>
    FocusUsersNotifier(
      ref.read(focusUserRepositoryProvider),
    )
);
