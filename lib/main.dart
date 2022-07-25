import 'package:flutter/material.dart';

import './screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: Colors.amberAccent,
              primary: Colors.deepPurple,
            ),
      ),
      home: const CategoriesScreen(),
    );
  }
}
