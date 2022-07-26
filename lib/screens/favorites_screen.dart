import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> meals;

  const FavoritesScreen(this.meals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return const Center(
        child: Text('You have no meals as favorite.'),
      );
    }

    return Center(
      child: ListView.builder(
        itemBuilder: (ctx, i) => MealCard(meals[i]),
        itemCount: meals.length,
      ),
    );
  }
}
