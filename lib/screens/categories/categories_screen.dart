import 'package:flutter/material.dart';
import 'package:learn_flutter/common/interfaces/title_holder.dart';
import 'package:learn_flutter/data/dummy_data.dart';
import 'package:learn_flutter/models/category.dart';
import 'package:learn_flutter/models/meal.dart';
import 'package:learn_flutter/screens/categories/widgets/category_grid_item.dart';
import 'package:learn_flutter/screens/meals/meals_screen.dart';

class CategoriesScreen extends StatelessWidget implements TitleHolder {
  final void Function(Meal) onLikeToggle;
  final List<Meal> availableMeals;

  const CategoriesScreen({super.key, required this.onLikeToggle, required this.availableMeals});

  @override
  String get title {
    return 'Category Selection';
  }

  void _selectCategory(BuildContext context, Category category) {
    var categotyMeals = availableMeals.where((element) => element.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(mealTitle: category.title, meals: categotyMeals, onLikeToggle: onLikeToggle);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var categories = availableCategories;

    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (var category in categories) CategoryGridItem(category: category, onCategorySelection: _selectCategory),
      ],
    );
  }
}
