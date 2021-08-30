import 'package:focus_cafe_flutter/ui/viewmodels/counter_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateNotifierProvider((_) => CounterViewModel());
