import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:money_planner/providers/accounts.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;

  const HomePage(
      {super.key, required this.toggleTheme, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<Accounts>(context).accounts;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Welcome back Laurence',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          IconButton(
              onPressed: toggleTheme,
              icon: Icon(themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode)),
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
              }),
        )
        //  Row(chi)
      ],
    );
  }
}
