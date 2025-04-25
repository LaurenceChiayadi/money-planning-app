import 'package:flutter/material.dart';
import 'package:money_planner/screens/onboarding_page.dart';
import 'package:provider/provider.dart';

import 'package:money_planner/assets/theme/theme.dart';
import 'package:money_planner/screens/home_page.dart';
import 'package:money_planner/screens/statistics_page.dart';
import 'package:money_planner/providers/accounts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Accounts())],
      child: MaterialApp(
          title: 'Money Planning App',
          darkTheme: CustomDarkModeTheme.theme,
          themeMode: _themeMode,
          initialRoute: '/onboard',
          routes: {
            '/': (context) =>
                HomePage(toggleTheme: _toggleTheme, themeMode: _themeMode),
            '/onboard': (context) => OnboardingPage(
                  themeMode: _themeMode,
                ),
          }),
    );
  }
}
