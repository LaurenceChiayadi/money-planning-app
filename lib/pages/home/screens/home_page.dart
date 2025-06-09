import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:money_planner/providers/ThemeProvider/theme_provider.dart';
import 'package:money_planner/shared/layout/layout.dart';
import 'package:money_planner/providers/AccountProvider/accounts_provider.dart';
import 'package:money_planner/utilities/finance_utils.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountsProvider);
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    double deviceWidth = MediaQuery.of(context).size.width;

    const currency = 'Rp';
    final mainBalanceAmount = formatFinanceAmount(888888888.toString());
    final todayTransaction = formatFinanceAmount(123456789.toString());

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
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.0,
                  children: [
                    Column(
                      children: [
                        Text(
                            AppLocalizations.of(context)!
                                .homepageBalanceWidgetTitle,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text('$currency $mainBalanceAmount',
                            style: Theme.of(context).textTheme.headlineLarge),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${AppLocalizations.of(context)!.homepageBalanceWidgetSubtitle}:'),
                              Text(
                                '$currency $todayTransaction',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              )
                            ])
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
