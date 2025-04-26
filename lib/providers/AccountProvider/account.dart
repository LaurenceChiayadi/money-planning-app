import 'package:flutter/material.dart';

class Account with ChangeNotifier {
  late final String id;
  late final String name;
  late final double currentAmount;

  Account({required this.id, required this.name, required this.currentAmount});
}
