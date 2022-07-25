import 'package:flutter/material.dart';

import '../screens/category_screen.dart';

class CategoryCard extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryCard({
    required this.id,
    required this.title,
    required this.color,
    Key? key,
  }) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryScreen.routeName,
      arguments: CategoryScreenArgs(id: id, title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        elevation: 0,
        shadowColor: color.withOpacity(1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
