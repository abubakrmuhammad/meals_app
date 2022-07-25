import 'package:flutter/material.dart';

import '../data.dart';

import '../widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: dummyCategories
            .map((cat) => CategoryCard(
                  title: cat.title,
                  color: cat.color,
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
