import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:money_planner/pages/home/widget/main_account_widget.dart';
import 'package:money_planner/providers/ThemeProvider/theme_provider.dart';
import 'package:money_planner/shared/layout/layout.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    return Layout(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () {},
              icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: const Icon(Icons.segment, size: 30)),
            ),
            IconButton(
              onPressed: themeNotifier.toggleTheme,
              icon: Icon(themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
            ),
          ]),
          const MainAccountWidget()
        ],
      ),
    );
  }
}
