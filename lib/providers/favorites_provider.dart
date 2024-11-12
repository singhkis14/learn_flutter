import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/models/meal.dart';

class FavoriteMealsNotofier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotofier() : super([]);

  String toggleMealFavoriteStatus(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return 'Unmarked favorite';
    } else {
      state = [...state, meal];
      return 'Marked favorite';
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotofier, List<Meal>>((ref) {
  return FavoriteMealsNotofier();
});
