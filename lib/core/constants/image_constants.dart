enum ImageConstants {
  macbook,
  iphone15Pro,
  ipadPro,
  watchSeries9,
  airpodsPro,
  ipadAir,
}

extension ImageConstantsExtension on ImageConstants {
  String get dir {
    switch (this) {
      case ImageConstants.macbook:
        return 'assets/images/mbp_16.jpeg';
      case ImageConstants.iphone15Pro:
        return 'assets/images/iphone_15_pro.png';
      case ImageConstants.ipadPro:
        return 'assets/images/ipad_pro_11.jpeg';
      case ImageConstants.watchSeries9:
        return 'assets/images/watch_s9.png';
      case ImageConstants.airpodsPro:
        return 'assets/images/airpods.jpeg';
      case ImageConstants.ipadAir:
        return 'assets/images/ipad_air.jpeg';
      default:
        return '';
    }
  }
}
