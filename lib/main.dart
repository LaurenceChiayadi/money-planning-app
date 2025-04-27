import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:money_planner/providers/ThemeProvider/theme_provider.dart';
import 'package:money_planner/providers/AccountProvider/accounts.dart';

import 'package:money_planner/core/theme/theme.dart';
import 'package:money_planner/pages/home/screens/home_page.dart';
import 'package:money_planner/pages/onboarding/screens/onboarding_page.dart';

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
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            initialRoute: '/onboard',
            routes: {
              '/': (context) => const HomePage(),
              '/onboard': (context) => const OnboardingPage(),
            },
          );
        },
      ),
    );
  }
}
