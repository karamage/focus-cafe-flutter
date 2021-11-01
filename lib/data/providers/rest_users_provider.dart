import 'package:focus_cafe_flutter/data/models/rest_users.dart';
import 'package:focus_cafe_flutter/data/providers/rest_user_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_users_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final restUsersProvider = StateNotifierProvider.autoDispose<RestUsersNotifier, RestUsers>((ref) =>
    RestUsersNotifier(
      ref.read(restUserRepositoryProvider),
    )
);
