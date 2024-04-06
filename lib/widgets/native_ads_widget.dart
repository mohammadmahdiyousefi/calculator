import 'dart:async';

import 'package:adivery/adivery.dart';
import 'package:adivery/adivery_ads.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  List<NativeAd> nativeAds = [];
  int _currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  //------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    AdiveryPlugin.prepareInterstitialAd('bc6c3f9a-77f0-4c35-8907-4a41dfb27ad1');
    nativeAds.add(_loadNativeAd());
    nativeAds.add(_loadNativeAd());
    nativeAds.add(_loadNativeAd());
    nativeAds.add(_loadNativeAd());
    nativeAds.add(_loadNativeAd());
    nativeAds.add(_loadNativeAd());
    _pageController = PageController(viewportFraction: 0.83);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if ((_pageController.page!.toInt()) < nativeAds.length - 1) {
        _currentPage = _pageController.page!.toInt() + 1;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  NativeAd _loadNativeAd() {
    final NativeAd nativeAd = NativeAd(
      "bc6c3f9a-77f0-4c35-8907-4a41dfb27ad1",
      onAdLoaded: _onNativeAdLoaded,
      onAdClicked: () {},
    );
    nativeAd.loadAd();
    return nativeAd;
  }

  void _onNativeAdLoaded() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (nativeAds.every((element) => element.isLoaded == false)) {
      return const SizedBox();
    } else {
      return SizedBox(
        height: 260,
        child: PageView.builder(
          controller: _pageController,
          itemCount: nativeAds.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                nativeAds[index].recordClick();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: nativeAds[index].image != null
                    ? Column(
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: nativeAds[index].image!.image,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const Gap(8),
                          ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            leading: Container(
                              height: 35,
                              width: 75,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      width: 2,
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Center(
                                child: Text(
                                  nativeAds[index].callToAction!,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                  style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                            title: Text(
                              nativeAds[index].description!,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                            ),
                            subtitle: Text(
                              nativeAds[index].headline!,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                            ),
                            trailing: Image(
                              image: nativeAds[index].icon!.image,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
              ),
            );
          },
        ),
      );
    }
  }
}
