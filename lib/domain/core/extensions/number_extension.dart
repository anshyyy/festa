import 'package:intl/intl.dart';

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;

  String toIndianRupeeString() {
    final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹',decimalDigits: 0);
    return format.format(this);
  }
}
