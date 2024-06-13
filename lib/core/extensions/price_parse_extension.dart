import 'package:intl/intl.dart';

extension PriceParse on double {
  String parsePrice() {
    final format = NumberFormat("#.##");
    return format.format(this);
  }
}
