import 'package:adivery/adivery.dart';

void showInterstitial() async {
  AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
  await AdiveryPlugin.isLoaded('b27de982-c95c-4adf-b865-0b3720e32517').then(
      (isLoaded) =>
          showPlacement(isLoaded!, 'b27de982-c95c-4adf-b865-0b3720e32517'));
}

void showPlacement(bool isLoaded, String placementId) {
  if (isLoaded) {
    AdiveryPlugin.show(placementId);
  }
}
