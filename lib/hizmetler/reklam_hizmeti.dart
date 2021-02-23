import 'package:firebase_admob/firebase_admob.dart';

class ReklamHizmet {
  static final ReklamHizmet _instance = ReklamHizmet._internal();
  factory ReklamHizmet() => _instance;
  MobileAdTargetingInfo _targetingInfo;

  ReklamHizmet._internal() {
    _targetingInfo = MobileAdTargetingInfo();
  }

  InterstitialAd interstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: _targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }

  showIntersitial() {
    interstitialAd()
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
    interstitialAd().dispose();
  }
}
