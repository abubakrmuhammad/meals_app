import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
          ),
          const _DrawerItem(
            icon: Icons.restaurant,
            text: 'Meals',
            routeName: '/',
          ),
          const SizedBox(height: 6),
          const _DrawerItem(
            icon: Icons.settings,
            text: 'Filters',
            routeName: FiltersScreen.routeName,
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String routeName;

  const _DrawerItem({
    required this.icon,
    required this.text,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }
}
