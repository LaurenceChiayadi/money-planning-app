import 'package:flutter/material.dart';
import 'package:money_planner/providers/ThemeProvider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'package:money_planner/assets/theme/theme.dart';
import 'package:money_planner/screens/home_page.dart';
import 'package:money_planner/screens/onboarding_page.dart';
import 'package:money_planner/providers/AccountProvider/accounts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ThemeProvider()),
        ChangeNotifierProvider(create: (ctx) => Accounts()),
      ],
      child: Builder(
        builder: (context) {
          final themeMode = context.watch<ThemeProvider>().themeMode;
          return MaterialApp(
            title: 'Money Planning App',
            theme: CustomTheme.theme,
            darkTheme: CustomDarkModeTheme.theme,
            themeMode: themeMode,
            initialRoute: '/onboard',
            routes: {
              '/': (context) => const HomePage(),
              '/onboard': (context) => OnboardingPage(),
            },
          );
        },
      ),
    );
  }
}
