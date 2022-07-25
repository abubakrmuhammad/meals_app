import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_screen.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard(this.meal, {Key? key}) : super(key: key);

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void viewMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewMeal(context),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 250,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black45],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 15,
                    width: 320,
                    child: Text(meal.title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MealCardDetail(
                      icon: Icons.schedule,
                      text: '${meal.duration} min',
                    ),
                    MealCardDetail(
                      icon: Icons.work_outline,
                      text: complexityText,
                    ),
                    MealCardDetail(
                      icon: Icons.attach_money,
                      text: affordabilityText,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class MealCardDetail extends StatelessWidget {
  const MealCardDetail({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
