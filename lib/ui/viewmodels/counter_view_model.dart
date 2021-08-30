import 'package:focus_cafe_flutter/data/models/counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterViewModel extends StateNotifier<Counter> {
  CounterViewModel() : super(const Counter()) {}
  increment() => state = state.copyWith(counter: state.counter + 1);
}
