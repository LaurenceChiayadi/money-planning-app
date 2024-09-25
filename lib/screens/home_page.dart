import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;

  const HomePage(
      {super.key, required this.toggleTheme, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Welcome back Laurence',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          IconButton(
              onPressed: toggleTheme,
              icon: Icon(themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode)),
        ])
      ],
    );
  }
}
