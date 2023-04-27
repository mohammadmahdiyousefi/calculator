import 'package:adivery/adivery.dart';
import 'package:adivery/adivery_ads.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/view/futhers_screen/age.dart';
import 'package:calculator/view/futhers_screen/area.dart';
import 'package:calculator/view/futhers_screen/bmi.dart';
import 'package:calculator/view/futhers_screen/length.dart';
import 'package:calculator/view/futhers_screen/speed.dart';
import 'package:calculator/view/futhers_screen/tempetature.dart';
import 'package:calculator/view/futhers_screen/time.dart';
import 'package:calculator/widgets/property_container.dart';
import 'package:flutter/material.dart';
import 'futhers_screen/storage.dart';

class SecoundScreen extends StatefulWidget {
  const SecoundScreen({Key? key}) : super(key: key);

  @override
  State<SecoundScreen> createState() => _SecoundScreenState();
}

class _SecoundScreenState extends State<SecoundScreen> {
//--------------------- banner ad ----------------------------------------------
  BannerAd? _ads;
//------------------------------------------------------------------------------
//-------------------- navigator page metod ------------------------------------
  void nextpage(Widget newpage) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return newpage;
    }));
  }

//------------------------------------------------------------------------------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    creatabannerad();
    AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
  }

//------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  Property(
                    boxicon: Icons.category,
                    titel: 'Area',
                    newpage: const AreaScreen(),
                  ),
                  Property(
                    boxicon: Icons.straighten,
                    titel: 'Length',
                    newpage: const LengthScreen(),
                  ),
                  Property(
                      boxicon: Icons.thermostat,
                      titel: 'Temperature',
                      newpage: const TempetatureScreen()),
                  Property(
                    boxicon: Icons.speed,
                    titel: 'Speed',
                    newpage: const SpeedScreen(),
                  ),
                  Property(
                    boxicon: Icons.data_usage,
                    titel: 'Data',
                    newpage: const StorageScreen(),
                  ),
                  Property(
                    boxicon: Icons.timer,
                    titel: 'Time',
                    newpage: const TimeScreen(),
                  ),
                  Property(
                    boxicon: Icons.family_restroom,
                    titel: 'BMI',
                    newpage: const BmiScreen(),
                  ),
                  Property(
                    boxicon: Icons.cake,
                    titel: 'Age',
                    newpage: const AgeScreen(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: _ads ?? Container(),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: _ads ?? Container(),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: _ads ?? Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

//------------------------------------------------------------------------------------

  Widget bottom(
      {IconData boxicon = Icons.mp, String titel = '', Widget? newpage}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: 130,
        width: (MediaQuery.of(context).size.width / 3) - 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0),
          onPressed: () {
            nextpage(newpage!);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                boxicon,
                color: AppColor.iconcolor,
                size: 40,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                titel,
                style: TextStyle(color: AppColor.iconcolor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void creatabannerad() {
    _ads = BannerAd(
      'eca798bf-4ff0-435d-a8e4-f3edcfdbdcac',
      BannerAdSize.BANNER,
      onAdLoaded: (ad) {
        ad.loadAd();
      },
      onAdClicked: (ad) {},
      onError: (ad, reason) {},
    );
  }
}
