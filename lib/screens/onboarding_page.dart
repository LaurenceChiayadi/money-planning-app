import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> onboardingData = [
      {
        'title': AppLocalizations.of(context)!.onboarding1Title,
        'subtitle': AppLocalizations.of(context)!.onboarding1Description,
      },
      {
        'title': AppLocalizations.of(context)!.onboarding2Title,
        'subtitle': AppLocalizations.of(context)!.onboarding2Description,
      },
      {
        'title': AppLocalizations.of(context)!.onboarding3Title,
        'subtitle': AppLocalizations.of(context)!.onboarding3Description,
      },
    ];

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
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 20),
        Text(subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            )),
        const SizedBox(height: 40),
        if (isLastPage)
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text(AppLocalizations.of(context)!.onboardingGetStarted),
          )
      ],
    );
  }
}
