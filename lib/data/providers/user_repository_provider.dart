import 'package:focus_cafe_flutter/data/providers/datasource_repository_provider.dart';
import 'package:focus_cafe_flutter/data/repository/user_repository.dart';
import 'package:focus_cafe_flutter/data/repository/user_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>(
        (ref) => UserRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
