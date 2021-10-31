import 'package:focus_cafe_flutter/data/providers/datasource_repository_provider.dart';
import 'package:focus_cafe_flutter/data/repository/focus_user_repository.dart';
import 'package:focus_cafe_flutter/data/repository/focus_user_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final focusUserRepositoryProvider = Provider<FocusUserRepository>(
        (ref) => FocusUserRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
