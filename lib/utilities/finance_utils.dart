import 'package:intl/intl.dart';

String formatFinanceAmount(double input) {
  var formatter = NumberFormat('#,###,000');

  return formatter.format(input);
}
