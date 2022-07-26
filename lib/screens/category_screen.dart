import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_card.dart';

class CategoryScreenArgs {
  final String id;
  final String title;

  const CategoryScreenArgs({
    required this.id,
    required this.title,
  });
}

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  final List<Meal> meals;

  const CategoryScreen(
    this.meals, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as CategoryScreenArgs;

    final categoryMeals = meals
        .where(
          (meal) => meal.categories.contains(routeArgs.id),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, i) => MealCard(categoryMeals[i]),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
