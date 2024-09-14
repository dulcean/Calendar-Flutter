import 'package:intl/intl.dart';

import 'date_enum.dart';

extension DateTimeFormating on DateTime {
  String toFormat() {
    Month month = Month.values[this.month - 1];
    String monthInGenetive = month.inGenetive;
    String time = DateFormat('HH:mm').format(this);
    return '$day $monthInGenetive $time';
  }
}