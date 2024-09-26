import 'package:flutter/material.dart';

import 'package:money_planner/providers/account.dart';

class Accounts with ChangeNotifier {
  final List<Account> _accounts = [
    Account(id: '1', name: 'Laurence Account', currentAmount: 0),
    Account(id: '2', name: 'Test Account', currentAmount: 100),
    Account(id: '3', name: 'Test Account1', currentAmount: 100)
  ];

  List<Account> get accounts => _accounts;

  Account findById(String id) {
    return _accounts.firstWhere((account) => account.id == id);
  }

  List<Account> filterName(String name) {
    return _accounts
        .where((account) =>
            account.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }
}
