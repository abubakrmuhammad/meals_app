import 'package:flutter/material.dart';

import '../models/meal.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({
    required this.favoriteMeals,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text('Meals App'),
          bottom: const TabBar(
            tabs: [
              MyTab(
                icon: Icons.category,
                text: 'Categories',
              ),
              MyTab(
                icon: Icons.star,
                text: 'Favorites',
              ),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        body: TabBarView(children: [
          const CategoriesScreen(),
          FavoritesScreen(favoriteMeals),
        ]),
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  final IconData icon;
  final String text;

  const MyTab({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(
            height: 2,
          ),
          Text(text),
        ],
      ),
    );
  }
}
