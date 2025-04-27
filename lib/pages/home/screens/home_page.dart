import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:money_planner/providers/ThemeProvider/theme_provider.dart';
import 'package:money_planner/shared/layout/layout.dart';
import 'package:money_planner/providers/AccountProvider/accounts_provider.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountsProvider);
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    double deviceWidth = MediaQuery.of(context).size.width;

    return Layout(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Welcome back Laurence',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            IconButton(
              onPressed: themeNotifier.toggleTheme,
              icon: Icon(themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
            ),
          ]),
          SizedBox(
            height: deviceWidth / 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: deviceWidth / 2,
                    height: deviceWidth / 2,
                    color: Colors.black12,
                    child: Text(account.name),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
