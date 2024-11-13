import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/data/dummy_data.dart';
import 'package:learn_flutter/models/category.dart';

final availableCategoriesProvider = Provider<List<Category>>((ref) {
  return availableCategories;
});
