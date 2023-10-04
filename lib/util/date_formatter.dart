import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final dateFormatterProvider = Provider((ref) {
  return DateFormatter();
});

class DateFormatter {
  final DateFormat _dateFormat = DateFormat('yyyy/MM/dd HH:mm');

  String format(DateTime dateTime) {
    return _dateFormat.format(dateTime);
  }
}
