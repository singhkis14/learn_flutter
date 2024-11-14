import 'package:learn_flutter/models/grocery_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryNotifier extends StateNotifier<List<GroceryItem>> {
  GroceryNotifier() : super([]);

  void addItem(GroceryItem item) {
    state = [...state, item];
  }

  void removeItem(GroceryItem item) {
    state = state.where((obj) => obj.id != item.id).toList();
  }
}

final groceryProvider = StateNotifierProvider<GroceryNotifier, List<GroceryItem>>(
  (ref) {
    return GroceryNotifier();
  },
);
