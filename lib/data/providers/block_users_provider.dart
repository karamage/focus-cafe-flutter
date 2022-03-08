import 'package:focus_cafe_flutter/data/models/block_users.dart';
import 'package:focus_cafe_flutter/data/providers/block_user_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/block_users_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final blockUsersProvider = StateNotifierProvider<BlockUsersNotifier, BlockUsers>((ref) =>
    BlockUsersNotifier(
      ref.read(blockUserRepositoryProvider),
    )
);
