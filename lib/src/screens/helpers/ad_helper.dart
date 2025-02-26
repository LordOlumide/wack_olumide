import 'dart:io';

class AdHelper {
  static const String testAdUnitId = '/21775744923/example/interstitial';

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8930570865147939/5249034236';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
