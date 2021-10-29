import 'package:intl/intl.dart';

extension DateExtensions on String {
  DateTime get parseStringToDate {
    return DateFormat('yyyy-MM-dd hh:mm:ss').parse(this);
  }
}

extension ParseTimeExtensions on String {
  String get parseToTime {
    DateTime val = DateFormat('yyyy-MM-dd hh:mm:ss').parse(this);
    return DateFormat('h:mm').format(val);
  }
}

extension ParseTimeFormatExtensions on String {
  String get parseToTimeFormat {
    DateTime val = DateFormat('yyyy-MM-dd hh:mm:ss').parse(this);
    return DateFormat('a').format(val);
  }
}

extension ParseDateExtensions on DateTime {
  String get convertToDate {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}

extension ParseDateTimeExtensions on String {
  String get customeDateTime {
    DateTime date = DateFormat('yyyy-MM-dd').parse(this);
    return DateFormat('EEEE, dd MMMM, yyyy', 'ms').format(date);
  }
}
