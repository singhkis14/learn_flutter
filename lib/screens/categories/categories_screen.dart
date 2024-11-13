import 'package:flutter/material.dart';
import 'package:learn_flutter/common/interfaces/title_holder.dart';
import 'package:learn_flutter/data/dummy_data.dart';
import 'package:learn_flutter/models/category.dart';
import 'package:learn_flutter/models/meal.dart';
import 'package:learn_flutter/screens/categories/widgets/category_grid_item.dart';
import 'package:learn_flutter/screens/meals/meals_screen.dart';

class CategoriesScreen extends StatefulWidget implements TitleHolder {
  final List<Meal> availableMeals;

  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  String get title {
    return 'Category Selection';
  }

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    var categotyMeals = widget.availableMeals.where((element) => element.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(mealTitle: category.title, meals: categotyMeals);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var categories = availableCategories;

    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(parent: _animationController, curve: Curves.bounceOut),
          ),
          child: child,
        );
      },
    );
  }
}
