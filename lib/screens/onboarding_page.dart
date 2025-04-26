import 'package:flutter/material.dart';
import 'package:money_planner/components/global/Layout.dart';

class OnboardingPage extends StatelessWidget {
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

  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemCount: onboardingData.length,
      itemBuilder: (context, index) {
        final page = onboardingData[index];
        return OnboardingScreen(
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

  const OnboardingScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 20),
        Text(subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            )),
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
