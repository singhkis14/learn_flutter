import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/grocery_list/grocery_list.dart';
import 'package:learn_flutter/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: app_theme,
      home: const GroceryList(),
    );
  }
}
