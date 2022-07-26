import 'package:flutter/material.dart';

import '../models/filters.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Filters filters;
  final void Function(Filters) updateFilters;

  const FiltersScreen({
    required this.filters,
    required this.updateFilters,
    Key? key,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.filters.glutenFree;
    _lactoseFree = widget.filters.lactoseFree;
    _vegan = widget.filters.vegan;
    _vegetarian = widget.filters.vegetarian;

    super.initState();
  }

  void saveFilters() {
    Filters updatedFilters = Filters(
      glutenFree: _glutenFree,
      lactoseFree: _lactoseFree,
      vegetarian: _vegetarian,
      vegan: _vegan,
    );

    widget.updateFilters(updatedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      drawer: const MainDrawer(),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _MySwitchListTile(
                value: _glutenFree,
                titleText: 'Gluten Free',
                subtitleText: 'Only include gluten-free meals.',
                updateHandler: (val) => setState(() {
                  _glutenFree = val;
                  saveFilters();
                }),
              ),
              _MySwitchListTile(
                value: _lactoseFree,
                titleText: 'Lactose Free',
                subtitleText: 'Only include lactose-free meals.',
                updateHandler: (val) => setState(() {
                  _lactoseFree = val;
                  saveFilters();
                }),
              ),
              _MySwitchListTile(
                value: _vegan,
                titleText: 'Vegan',
                subtitleText: 'Only include Vegan meals.',
                updateHandler: (val) => setState(() {
                  _vegan = val;
                  saveFilters();
                }),
              ),
              _MySwitchListTile(
                value: _vegetarian,
                titleText: 'Vegetarian',
                subtitleText: 'Only include vegetarian meals.',
                updateHandler: (val) => setState(() {
                  _vegetarian = val;
                  saveFilters();
                }),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class _MySwitchListTile extends StatelessWidget {
  final bool value;
  final String titleText;
  final String subtitleText;
  final void Function(bool) updateHandler;

  const _MySwitchListTile(
      {required this.value,
      required this.titleText,
      required this.subtitleText,
      required this.updateHandler,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.primary,
      value: value,
      title: Text(
        titleText,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitleText,
        style: const TextStyle(fontSize: 16),
      ),
      onChanged: updateHandler,
    );
  }
}
