import 'package:adivery/adivery.dart';
import 'package:adivery/adivery_ads.dart';

BannerAd? creatabannerad(BannerAdSize bannerAdSize) {
  AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
  BannerAd? ads = BannerAd(
    'eca798bf-4ff0-435d-a8e4-f3edcfdbdcac',
    bannerAdSize,
    onAdLoaded: (ad) {
      ad.loadAd();
    },
    onAdClicked: (ad) {},
    onError: (ad, reason) {},
  );
  return ads;
}
