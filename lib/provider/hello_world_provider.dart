import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world_provider.g.dart';

class CounterWidger extends ConsumerWidget {
  const CounterWidger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProider);
    final counterNew = ref.watch(counterNewProvider);
    final counterSN = ref.watch(counterSNProvider);
    final counterRiv = ref.watch(counterRivProvider);

    return Column(
      children: [
        ElevatedButton(
          onPressed: () => ref.read(counterProider.notifier).state++,
          child: Text('Value : $counter'),
        ),
        ElevatedButton(
          onPressed: () => ref.read(counterNewProvider.notifier).increment(),
          child: Text('Value New : $counterNew'),
        ),
        ElevatedButton(
          onPressed: () => ref.read(counterSNProvider.notifier).increment(),
          child: Text('Value SN : $counterSN'),
        ),
        ElevatedButton(
          onPressed: () => ref.read(counterRivProvider.notifier).increment(),
          child: Text('Value Riv : $counterRiv'),
        ),
      ],
    );
  }
}

final counterProider = StateProvider<int>((ref) {
  return 0;
});

class CounterSN extends StateNotifier<int> {
  CounterSN() : super(0);

  void increment() {
    state++;
  }
}

final counterSNProvider = StateNotifierProvider<CounterSN, int>((ref) {
  return CounterSN();
});

class Counter extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterNewProvider = NotifierProvider<Counter, int>(Counter.new);

@riverpod
class CounterRiv extends _$CounterRiv {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}
