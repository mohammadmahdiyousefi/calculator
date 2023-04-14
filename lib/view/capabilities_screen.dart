import 'package:adivery/adivery.dart';
import 'package:adivery/adivery_ads.dart';
import 'package:calculator/view/futhers_screen/area.dart';
import 'package:calculator/view/futhers_screen/bmi.dart';

import 'package:calculator/view/futhers_screen/length.dart';
import 'package:calculator/view/futhers_screen/speed.dart';
import 'package:calculator/view/futhers_screen/tempetature.dart';
import 'package:calculator/view/futhers_screen/time.dart';
import 'package:calculator/widgets/property_container.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'futhers_screen/storage.dart';

class SecoundScreen extends StatefulWidget {
  const SecoundScreen({Key? key}) : super(key: key);

  @override
  State<SecoundScreen> createState() => _SecoundScreenState();
}

class _SecoundScreenState extends State<SecoundScreen> {
  BannerAd? _ads;
  void nextpage(Widget newpage) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return newpage;
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    creatabannerad();
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
                    newpage: null,
                  ),
                  Property(
                    boxicon: Icons.money,
                    titel: 'Currency',
                    newpage: null,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: _ads == null ? Container() : _ads,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: _ads == null ? Container() : _ads,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: _ads == null ? Container() : _ads,
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
      padding: EdgeInsets.all(5),
      child: Container(
        height: 130,
        width: (MediaQuery.of(context).size.width / 3) - 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).scaffoldBackgroundColor, elevation: 0),
          onPressed: () {
            nextpage(newpage!);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                boxicon,
                color: Colors.orange.shade800,
                size: 40,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                titel,
                style: TextStyle(color: Colors.orange),
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
