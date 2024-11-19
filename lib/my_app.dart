import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/provider/hello_world_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String message = ref.watch(helloWorldProvider);
    // final String message = ref.watch(helloWorld2Provider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod'),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
