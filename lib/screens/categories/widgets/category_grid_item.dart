import 'package:flutter/material.dart';
import 'package:learn_flutter/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function(BuildContext context, Category category) onCategorySelection;

  const CategoryGridItem({super.key, required this.category, required this.onCategorySelection});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategorySelection(context, category);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.55),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
