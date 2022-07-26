import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/category_screen.dart';
import './screens/meal_screen.dart';

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
              titleMedium: TextStyle(
                color: Colors.grey[900],
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      home: const TabsScreen(),
      routes: {
        CategoryScreen.routeName: (ctx) => const CategoryScreen(),
        MealScreen.routeName: (ctx) => const MealScreen(),
      },
    );
  }
}
