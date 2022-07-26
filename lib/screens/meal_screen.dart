import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meal';

  final Function toggleFavorite;
  final Function isFavoriteMeal;

  const MealScreen({
    required this.toggleFavorite,
    required this.isFavoriteMeal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    final ingredients = meal.ingredients.map((ing) {
      final splitted = ing.split(' ');

      final amount = splitted[0];
      final name = splitted.sublist(1).join(' ');

      return _Ingredient(amount: amount, name: name);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(meal.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 300,
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
                  width: 360,
                  child: Text(meal.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: double.infinity,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _MealDetailTitle('Ingredients'),
                  GridView.builder(
                    itemCount: ingredients.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                    ),
                    itemBuilder: (ctx, i) => _IngredientCard(ingredients[i]),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // childAspectRatio: 4 / 3,
                  ),
                  const _MealDetailTitle('Instructions'),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((ctx, i) => Column(
                              children: [
                                _MealInstruction(
                                  index: i,
                                  text: meal.steps[i],
                                ),
                                if (i != meal.steps.length - 1) const Divider(),
                              ],
                            )),
                        itemCount: meal.steps.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavoriteMeal(meal.id) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavorite(meal.id);
        },
      ),
    );
  }
}

class _MealInstruction extends StatelessWidget {
  final int index;
  final String text;

  const _MealInstruction({
    required this.index,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: Text('# ${index + 1}'),
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
      ),
    );
  }
}

class _MealDetailTitle extends StatelessWidget {
  final String text;

  const _MealDetailTitle(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 36),
      ),
    );
  }
}

class _IngredientCard extends StatelessWidget {
  final _Ingredient ing;

  const _IngredientCard(
    this.ing, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: FittedBox(
                  child: Text(
                    ing.amount,
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 40,
              child: Text(
                ing.name,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Ingredient {
  final String amount;
  final String name;

  const _Ingredient({required this.amount, required this.name});
}
