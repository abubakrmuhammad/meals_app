import 'package:flutter/material.dart';

import './data.dart';

import './models/meal.dart';
import './models/filters.dart';

import './screens/tabs_screen.dart';
import './screens/category_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters = Filters();
  List<Meal> _filteredMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void updateFilters(Filters newFilters) {
    setState(() {
      _filters = newFilters;

      _filteredMeals = dummyMeals.where((meal) {
        if (_filters.glutenFree && !meal.isGlutenFree) return false;
        if (_filters.lactoseFree && !meal.isLactoseFree) return false;
        if (_filters.vegetarian && !meal.isVegetarian) return false;
        if (_filters.vegan && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    setState(() {
      if (existingIndex >= 0) {
        _favoriteMeals.removeAt(existingIndex);
      } else {
        final mealToAdd = dummyMeals.firstWhere((meal) => meal.id == mealId);

        _favoriteMeals.add(mealToAdd);
      }
    });
  }

  bool _isFavoriteMeal(String mealId) =>
      _favoriteMeals.any((meal) => meal.id == mealId);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: Colors.amberAccent,
              primary: Colors.deepPurple,
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: TextStyle(
                color: Colors.grey[900],
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      home: TabsScreen(
        favoriteMeals: _favoriteMeals,
      ),
      routes: {
        CategoryScreen.routeName: (ctx) => CategoryScreen(_filteredMeals),
        MealScreen.routeName: (ctx) => MealScreen(
              toggleFavorite: _toggleFavorite,
              isFavoriteMeal: _isFavoriteMeal,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              filters: _filters,
              updateFilters: updateFilters,
            ),
      },
    );
  }
}
