import 'package:flutter/material.dart';
import 'package:learn_flutter/provider/hello_world_provider.dart';
import 'package:learn_flutter/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod'),
        ),
        body: const Center(
          child: CounterWidger(),
        ),
      ),
    );
  }
}
