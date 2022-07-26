import 'package:flutter/material.dart';

import '../data.dart';

import '../widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: dummyCategories
          .map((cat) => CategoryCard(
                id: cat.id,
                title: cat.title,
                color: cat.color,
              ))
          .toList(),
    );
  }
}
