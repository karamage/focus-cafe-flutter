import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/providers/user_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/my_user_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myUserProvider = StateNotifierProvider<MyUserNotifier, User>((ref) => MyUserNotifier(repository: ref.read(userRepositoryProvider)));
