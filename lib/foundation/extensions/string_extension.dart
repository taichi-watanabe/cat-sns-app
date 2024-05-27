import 'package:intl/intl.dart';

extension StringExtenion on String {
  String priceFormat() {
    final oCcy = NumberFormat("#,##0", "en_US");
    return oCcy.format(int.tryParse(this));
  }

  String removeSchemeFromUrl() {
    if (startsWith('https://')) {
      return substring('https://'.length);
    } else if (startsWith('http://')) {
      return substring('http://'.length);
    }
    return this;
  }

  String formatOperationPeriod(String operationEndAt) {
    final dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");

    DateTime operationBeginDate = dateFormat.parse(this);
    DateTime operationEndDate = dateFormat.parse(operationEndAt);

    DateTime now = DateTime.now();

    // If current date is after the operation end date, limit the current date to the operation end date.
    if (now.isAfter(operationEndDate)) {
      now = operationEndDate;
    }

    // Calculate the duration from the operation begin date to now.
    int monthsFromBegin = now.difference(operationBeginDate).inDays ~/ 30;
    int yearsFromBegin = monthsFromBegin ~/ 12;
    monthsFromBegin %= 12;

    // Only show years if it's more than 0
    String yearsFromBeginString = yearsFromBegin > 0 ? "$yearsFromBegin年" : "";
    String monthsFromBeginString =
        monthsFromBegin > 0 ? "$monthsFromBeginヶ月" : "1ヶ月";

    return "$yearsFromBeginString$monthsFromBeginString";
  }
}
