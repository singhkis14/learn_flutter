import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/tabs/tabs_screen.dart';
import 'package:learn_flutter/themes/app_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: app_theme,
      home: const TabsScreen(),
    );
  }
}
