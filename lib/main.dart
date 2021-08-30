import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus_cafe_flutter/data/providers/counter_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// A Counter example implemented with riverpod

//final counterProvider = StateNotifierProvider<Counter, int>((_) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

void main() {
  runApp(
    ProviderScope(
      child: CounterApp(),
    ),
  );
}

// Note: CounterApp is a HookWidget, from flutter_hooks.
class CounterApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterProvider);
    final counter = ref.read(counterProvider.notifier);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CounterApp')),
        body: Center(
          child: Text(state.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() => counter.increment(),
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

/*
void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

/// Providers are declared globally and specifies how to create a state
final counterProvider = StateNotifierProvider<Counter, int>((_) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}
//final counterProvider = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        // Consumer is a widget that allows you reading providers.
        // You could also use the hook "ref.watch(" if you uses flutter_hooks
        child: Consumer(builder: (context, ref, _) {
          final count = ref.watch(counterProvider);
          return Text('$count');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
 */

