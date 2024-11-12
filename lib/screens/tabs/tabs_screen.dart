import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/common/drawer/main_drawer.dart';
import 'package:learn_flutter/common/interfaces/title_holder.dart';
import 'package:learn_flutter/models/filter.dart';
import 'package:learn_flutter/providers/favorites_provider.dart';
import 'package:learn_flutter/providers/filters_provider.dart';
import 'package:learn_flutter/screens/categories/categories_screen.dart';
import 'package:learn_flutter/screens/filters/filters_screen.dart';
import 'package:learn_flutter/screens/meals/meals_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    final favoriteMeals = ref.watch(favoriteMealsProvider);
    var screens = [CategoriesScreen(availableMeals: availableMeals), MealsScreen(meals: favoriteMeals)];
    final selectedScreen = screens[_selectedPageIndex];

    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen),
      appBar: AppBar(
        title: Text((selectedScreen as TitleHolder).title),
      ),
      body: screens[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.orange,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push<Map<Filter, bool>?>(MaterialPageRoute(builder: (context) => const FilterScreen()));
    } else {}
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
