import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:money_planner/providers/ThemeProvider/theme_provider.dart';

import 'package:money_planner/core/theme/theme.dart';
import 'package:money_planner/pages/home/screens/home_page.dart';
import 'package:money_planner/pages/onboarding/screens/onboarding_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

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
  }
}
