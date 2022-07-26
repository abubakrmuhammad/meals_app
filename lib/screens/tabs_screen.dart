import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen(),
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
