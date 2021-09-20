import 'package:focus_cafe_flutter/data/providers/datasource_repository_provider.dart';
import 'package:focus_cafe_flutter/data/repository/done_repository.dart';
import 'package:focus_cafe_flutter/data/repository/done_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final doneRepositoryProvider = Provider<DoneRepository>(
        (ref) => DoneRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
