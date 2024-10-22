import 'package:intl/intl.dart';

class FormatNumber {
  static String formatBudgetWithDots(int? budget) {
    if (budget == null || budget == 0) {
      return '-';
    }
    final formatter = NumberFormat('#,##0', 'tr_TR');
    return formatter.format(budget);
  }
}
