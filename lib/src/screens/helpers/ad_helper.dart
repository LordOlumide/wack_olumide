import 'dart:io';

class AdHelper {
  static const String testInterstitialAdUnitId =
      '/21775744923/example/interstitial';

  static const String testRewardedAdUnitId =
      'ca-app-pub-3940256099942544/5224354917';

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8930570865147939/5249034236';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8930570865147939/6218237647';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
