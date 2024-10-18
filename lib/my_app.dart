import 'package:flutter/material.dart';
import 'package:learn_flutter/start_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: StartScreen(),
      ),
    );
  }
}
