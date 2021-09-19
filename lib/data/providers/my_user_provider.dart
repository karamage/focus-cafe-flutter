import 'package:focus_cafe_flutter/data/providers/user_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/my_user_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myUserProvider = StateNotifierProvider((ref) => MyUserViewModel(repository: ref.read(userRepositoryProvider)));
