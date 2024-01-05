import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperDateTime extends StatelessWidget {
  final DateTime now;

  HelperDateTime({required this.now});

  @override
  Widget build(BuildContext context) {
    var weekday = now.weekday;
    var daySymbol = '';

    switch (weekday) {
      case DateTime.monday:
        daySymbol = 'T2';
        break;
      case DateTime.tuesday:
        daySymbol = 'T3';
        break;
      case DateTime.wednesday:
        daySymbol = 'T4';
        break;
      case DateTime.thursday:
        daySymbol = 'T5';
        break;
      case DateTime.friday:
        daySymbol = 'T6';
        break;
      case DateTime.saturday:
        daySymbol = 'T7';
        break;
      case DateTime.sunday:
        daySymbol = 'CN';
        break;
    }

    var formatter = DateFormat('dd/MM/yyyy    h:mm a');
    var formatted = formatter.format(now);

    return Text('$daySymbol - $formatted',
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12));
  }
}
