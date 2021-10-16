import 'package:focus_cafe_flutter/data/providers/datasource_repository_provider.dart';
import 'package:focus_cafe_flutter/data/repository/activity_repository.dart';
import 'package:focus_cafe_flutter/data/repository/activity_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final activityRepositoryProvider = Provider<ActivityRepository>(
        (ref) => ActivityRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
