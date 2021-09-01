import 'package:focus_cafe_flutter/data/providers/datasource_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/viewmodels/app_state_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appStateProvider = StateNotifierProvider((ref) =>
    AppStateViewModel(ds: ref.read(datasourceRepositoryProvider))
);
