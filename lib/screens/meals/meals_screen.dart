import 'package:flutter/material.dart';
import 'package:learn_flutter/common/interfaces/title_holder.dart';
import 'package:learn_flutter/models/meal.dart';
import 'package:learn_flutter/screens/meals/widgets/meals_list.dart';
import 'package:learn_flutter/screens/meals/widgets/no_meal.dart';

class MealsScreen extends StatelessWidget implements TitleHolder {
  final String? mealTitle;

  @override
  String get title {
    return mealTitle == null ? 'Your Favorite' : mealTitle!;
  }

  final List<Meal> meals;
  final void Function(Meal) onLikeToggle;

  const MealsScreen({super.key, this.mealTitle, required this.meals, required this.onLikeToggle});

  @override
  Widget build(BuildContext context) {
    final content = meals.isEmpty ? const EmptyMeal() : MealList(meals: meals, onLikeToggle: onLikeToggle);
    if (mealTitle == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(mealTitle!),
        ),
        body: content,
      );
    }
  }
}
