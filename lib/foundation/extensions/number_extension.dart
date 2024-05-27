import 'package:intl/intl.dart';

extension NumberExt on int {
  String formatAmount() {
    final formatter = NumberFormat("#,###");
    return formatter.format(this);
  }
}
