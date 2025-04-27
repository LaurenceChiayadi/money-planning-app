import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:money_planner/providers/AccountProvider/account.dart';

class AccountsNotifier extends StateNotifier<List<Account>> {
  AccountsNotifier()
      : super([
          Account(id: '1', name: 'Laurence Account', currentAmount: 0),
          Account(id: '2', name: 'Test Account', currentAmount: 100),
          Account(id: '3', name: 'Test Account1', currentAmount: 100),
        ]);

  List<Account> getAccounts() => state;

  Account findById(String id) {
    return state.firstWhere((account) => account.id == id);
  }

  List<Account> filterName(String name) {
    return state
        .where((account) =>
            account.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }
}

final accountsProvider =
    StateNotifierProvider<AccountsNotifier, List<Account>>((ref) {
  return AccountsNotifier();
});
