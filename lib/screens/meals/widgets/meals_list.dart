import 'package:flutter/material.dart';
import 'package:learn_flutter/models/meal.dart';
import 'package:learn_flutter/screens/meals/widgets/meal_item.dart';

class MealList extends StatelessWidget {
  final List<Meal> meals;

  const MealList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        var meal = meals[index];
        return MealItem(meal);
      },
    );
    ;
  }
}
