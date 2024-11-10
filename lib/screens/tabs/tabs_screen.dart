import 'package:flutter/material.dart';
import 'package:learn_flutter/common/drawer/main_drawer.dart';
import 'package:learn_flutter/common/interfaces/title_holder.dart';
import 'package:learn_flutter/data/dummy_data.dart';
import 'package:learn_flutter/models/filter.dart';
import 'package:learn_flutter/models/meal.dart';
import 'package:learn_flutter/screens/categories/categories_screen.dart';
import 'package:learn_flutter/screens/filters/filters_screen.dart';
import 'package:learn_flutter/screens/meals/meals_screen.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegans: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _filtersApplied = Map.of(kInitialFilters);

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_filtersApplied[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filtersApplied[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_filtersApplied[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_filtersApplied[Filter.vegans]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    var screens = [
      CategoriesScreen(
        onLikeToggle: _toggleFavoriteMeal,
        availableMeals: availableMeals,
      ),
      MealsScreen(
        meals: _favoriteMeals,
        onLikeToggle: _toggleFavoriteMeal,
      )
    ];
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

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>?>(MaterialPageRoute(builder: (context) => FilterScreen(_filtersApplied)));
      setState(() {
        _filtersApplied = result ?? kInitialFilters;
      });
    } else {}
  }

  void _toggleFavoriteMeal(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfo('Unmarked Favorite');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfo('Marked Favorite');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showInfo(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
