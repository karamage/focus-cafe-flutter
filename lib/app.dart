// Note: CounterApp is a HookWidget, from flutter_hooks.
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus_cafe_flutter/data/providers/app_state_provider.dart';
import 'package:focus_cafe_flutter/data/providers/counter_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusCafeApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterProvider);
    final counter = ref.read(counterProvider.notifier);
    final appState = ref.read(appStateProvider.notifier);

    useEffect((){
          () async {
        print("appState.initApp() start");
        await appState.initApp();
        print("appState.initApp() end");
      }();
      return null;
    }, []);

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
