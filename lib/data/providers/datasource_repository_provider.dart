import 'package:focus_cafe_flutter/data/datasource/firebase_datasource.dart';
import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final datasourceRepositoryProvider = Provider<RemoteDatasource>(
        (ref) => FirebaseDatasource());
