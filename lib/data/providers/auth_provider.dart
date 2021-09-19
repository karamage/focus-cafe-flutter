import 'package:focus_cafe_flutter/data/providers/auth_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = StateNotifierProvider((ref) => AuthNotifier(repository: ref.read(authRepositoryProvider)));
