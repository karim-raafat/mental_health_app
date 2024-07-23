import 'package:intl/intl.dart';

String getTodayDate() {
  final now = DateTime.now();
  final formatter = DateFormat('d MMMM, yyyy');
  final formattedDate = formatter.format(now);

  return formattedDate;
}
