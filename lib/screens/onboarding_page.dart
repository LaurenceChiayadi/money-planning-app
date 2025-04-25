import 'package:flutter/material.dart';
import 'package:money_planner/components/global/Layout.dart';

class OnboardingPage extends StatelessWidget {
  final ThemeMode themeMode;
  final List<Map<String, dynamic>> onboardingData = [
    {
      'title': 'Welcome',
      'subtitle': 'Manage your money like a pro.',
    },
    {
      'title': 'Track Spending',
      'subtitle': 'Stay in control with real-time insights.',
    },
    {
      'title': 'Set Goals',
      'subtitle': 'Plan and reach your financial dreams.',
    },
  ];

  OnboardingPage({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemCount: onboardingData.length,
      itemBuilder: (context, index) {
        final page = onboardingData[index];
        return OnboardingScreen(
          themeMode: themeMode,
          title: page['title'],
          subtitle: page['subtitle'],
          isLastPage: index == onboardingData.length - 1,
        );
      },
    ));
  }
}

class OnboardingScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isLastPage;
  final ThemeMode themeMode;

  const OnboardingScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isLastPage,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black)),
        const SizedBox(height: 20),
        Text(subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: isDark ? Colors.white : Colors.black)),
        const SizedBox(height: 40),
        if (isLastPage)
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text("Get Started"),
          )
      ],
    );
  }
}
