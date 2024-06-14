import 'package:intl/intl.dart';

extension PriceParse on double {
  String parsePrice() {
    final format = NumberFormat("#,##0.00", "en_US");
    return format.format(this);
  }
}
