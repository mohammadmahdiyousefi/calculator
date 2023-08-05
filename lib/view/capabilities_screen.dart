import 'package:adivery/adivery.dart';
import 'package:adivery/adivery_ads.dart';
import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/view/futhers_screen/age.dart';
import 'package:calculator/view/futhers_screen/gpa_calculator.dart';
import 'package:calculator/view/futhers_screen/conversionScreen.dart';
import 'package:calculator/view/futhers_screen/bmi.dart';

import 'package:calculator/widgets/property_container.dart';
import 'package:flutter/material.dart';
import '../service/local/Storage_local_api.dart';
import '../service/local/Tempetature_local)api.dart';
import '../service/local/area_local_api.dart';
import '../service/local/length_local_api.dart';
import '../service/local/speed_local_api.dart';
import '../service/local/time_local_api.dart';

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
                    boximage: "geometrical-shapes",
                    titel: 'Area',
                    newpage: ConversionScreen(AreaApi().getdata(), 'Area'),
                  ),
                  Property(
                    boximage: "length",
                    titel: 'Length',
                    newpage: ConversionScreen(LengthApi().getdata(), 'Length'),
                  ),
                  Property(
                    boximage: "temperature",
                    titel: 'Temperature',
                    newpage: ConversionScreen(
                        TempetatureApi().getdata(), 'Temperature'),
                  ),
                  Property(
                    boximage: "speed",
                    titel: 'Speed',
                    newpage: ConversionScreen(SpeedApi().getdata(), 'Speed'),
                  ),
                  Property(
                    boximage: "data",
                    titel: 'Data',
                    newpage: ConversionScreen(StorageApi().getdata(), 'Data'),
                  ),
                  Property(
                    boximage: "time",
                    titel: 'Time',
                    newpage: ConversionScreen(TimeApi().getdata(), 'Time'),
                  ),
                  Property(
                    boximage: "bmi",
                    titel: 'BMI',
                    newpage: const BmiScreen(),
                  ),
                  Property(
                    boximage: "birthday",
                    titel: 'Age',
                    newpage: const AgeScreen(),
                  ),
                  Property(
                    boximage: "GPA",
                    titel: 'GPA',
                    newpage: const AvrageScreen(),
                  )
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
