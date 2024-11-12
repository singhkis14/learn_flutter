import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/models/filter.dart';
import 'package:learn_flutter/models/meal.dart';
import 'package:learn_flutter/providers/meals_provider.dart';

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  // Initial State
  FilterNotifier() : super({Filter.glutenFree: false, Filter.lactoseFree: false, Filter.vegetarian: false, Filter.vegans: false});

  void setFilters(Map<Filter, bool> newFilters) {
    state = newFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) {
  return FilterNotifier();
});

final filteredMealsProvider = Provider((ref) {
  List<Meal> meals = ref.watch(mealsProvider);
  var activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegans]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
