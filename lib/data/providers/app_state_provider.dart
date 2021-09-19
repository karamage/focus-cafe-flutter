import 'package:focus_cafe_flutter/data/providers/datasource_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/app_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appStateProvider = StateNotifierProvider((ref) =>
    AppStateNotifier(ds: ref.read(datasourceRepositoryProvider))
);
