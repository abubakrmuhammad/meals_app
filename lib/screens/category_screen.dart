import 'package:flutter/material.dart';

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

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as CategoryScreenArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title),
      ),
      body: const Center(
        child: Text('M E A L S'),
      ),
    );
  }
}
