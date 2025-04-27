import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_planner/pages/onboarding/widget/onboarding_layout.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> onboardingData = [
      {
        'lottieAnimation': 'lib/assets/onboarding/Animation1.json',
        'title': AppLocalizations.of(context)!.onboarding1Title,
        'subtitle': AppLocalizations.of(context)!.onboarding1Description,
      },
      {
        'lottieAnimation': 'lib/assets/onboarding/Animation2.json',
        'title': AppLocalizations.of(context)!.onboarding2Title,
        'subtitle': AppLocalizations.of(context)!.onboarding2Description,
      },
      {
        'lottieAnimation': 'lib/assets/onboarding/Animation3.json',
        'title': AppLocalizations.of(context)!.onboarding3Title,
        'subtitle': AppLocalizations.of(context)!.onboarding3Description,
      },
    ];

    return Scaffold(
        body: PageView.builder(
      itemCount: onboardingData.length,
      itemBuilder: (context, index) {
        final page = onboardingData[index];
        return OnboardingLayout(
          lottieAnimation: page['lottieAnimation'],
          title: page['title'],
          subtitle: page['subtitle'],
          isLastPage: index == onboardingData.length - 1,
        );
      },
    ));
  }
}
