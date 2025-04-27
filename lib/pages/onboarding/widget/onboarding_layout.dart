import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
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
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
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
