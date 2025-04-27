import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

class OnboardingLayout extends StatefulWidget {
  final String title;
  final String subtitle;
  final String lottieAnimation;
  final bool isLastPage;

  const OnboardingLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.lottieAnimation,
    required this.isLastPage,
  });

  @override
  State<OnboardingLayout> createState() => _OnboardingLayoutState();
}

class _OnboardingLayoutState extends State<OnboardingLayout>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(widget.lottieAnimation),
        Text(widget.title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 20),
        Text(widget.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            )),
        const SizedBox(height: 40),
        if (widget.isLastPage)
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
