import 'package:focus_cafe_flutter/data/providers/datasource_repository_provider.dart';
import 'package:focus_cafe_flutter/data/repository/notification_repository.dart';
import 'package:focus_cafe_flutter/data/repository/notification_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>(
        (ref) => NotificationRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
