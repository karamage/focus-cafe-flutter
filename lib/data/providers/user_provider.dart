import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/providers/user_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/user_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StateNotifierProvider.autoDispose.family<UserNotifier, User, String>((ref, userId) => UserNotifier(userId: userId, repository: ref.read(userRepositoryProvider)));
