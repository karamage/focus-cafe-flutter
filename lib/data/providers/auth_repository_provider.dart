import 'package:focus_cafe_flutter/data/providers/datasource_repository_provider.dart';
import 'package:focus_cafe_flutter/data/repository/auth_repository.dart';
import 'package:focus_cafe_flutter/data/repository/auth_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>(
        (ref) => AuthRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
