import 'package:adivery/adivery_ads.dart';
import 'package:calculator/bloc/age/age_bloc.dart';
import 'package:calculator/bloc/gpa/gpa_bloc.dart';
import 'package:calculator/bloc/gpa/gpa_state.dart';
import 'package:calculator/bloc/unitconversion/unitconversion_event.dart';
import 'package:calculator/service/local/unit_local_date.dart';
import 'package:calculator/view/futhers_screen/age.dart';
import 'package:calculator/view/futhers_screen/gpa_calculator.dart';
import 'package:calculator/view/futhers_screen/conversion_screen.dart';
import 'package:calculator/view/futhers_screen/bmi.dart';
import 'package:calculator/widgets/banner_ads.dart';
import 'package:calculator/widgets/native_ads_widget.dart';
import 'package:calculator/widgets/property_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/unitconversion/unitconversion_bloc.dart';

class SecoundScreen extends StatelessWidget {
  const SecoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const NativeAdWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Unit Converter",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.grey, fontSize: 10),
                      ),
                      const Expanded(
                        child: Divider(
                          endIndent: 0,
                          indent: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(children: units()),
                creatabannerad(BannerAdSize.BANNER) ?? Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Utility tools",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.grey, fontSize: 10),
                      ),
                      const Expanded(
                        child: Divider(
                          endIndent: 0,
                          indent: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(children: property()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> units() {
    return [
      Property(
        boximage: "ruler",
        titel: 'Length',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc length = UnitconversionBloc();
            length.add(UnitconversionInitial(lengthApi[0], lengthApi[1]));
            return length;
          },
          child: ConversionScreen(lengthApi, 'Length'),
        ),
      ),
      Property(
        boximage: "rectangle-2-svgrepo-com",
        titel: 'Area',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc area = UnitconversionBloc();
            area.add(UnitconversionInitial(areaApi[0], areaApi[1]));
            return area;
          },
          child: ConversionScreen(areaApi, 'Area'),
        ),
      ),
      Property(
        boximage:
            "bottle-of-glass-with-massage-oil-of-aromatherapy-for-spa-svgrepo-com",
        titel: 'Volume',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc volume = UnitconversionBloc();
            volume.add(UnitconversionInitial(volumeApi[0], volumeApi[1]));
            return volume;
          },
          child: ConversionScreen(volumeApi, 'Volume'),
        ),
      ),
      Property(
        boximage: "clock-svgrepo-com",
        titel: 'Time',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc time = UnitconversionBloc();
            time.add(UnitconversionInitial(timeApi[0], timeApi[1]));
            return time;
          },
          child: ConversionScreen(timeApi, 'Time'),
        ),
      ),
      Property(
        boximage: "temperature-half-svgrepo-com",
        titel: 'Temperature',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc tempetature = UnitconversionBloc();
            tempetature.add(
                UnitconversionInitial(tempetatureApi[0], tempetatureApi[1]));
            return tempetature;
          },
          child: ConversionScreen(tempetatureApi, 'Temperature'),
        ),
      ),
      Property(
        boximage: "speedometer2-svgrepo-com",
        titel: 'Speed',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc speed = UnitconversionBloc();
            speed.add(UnitconversionInitial(speedApi[0], speedApi[1]));
            return speed;
          },
          child: ConversionScreen(speedApi, 'Speed'),
        ),
      ),
      Property(
        boximage: "weight-svgrepo-com",
        titel: 'Mass',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc mass = UnitconversionBloc();
            mass.add(UnitconversionInitial(massApi[0], massApi[1]));
            return mass;
          },
          child: ConversionScreen(massApi, 'Mass'),
        ),
      ),
      Property(
        boximage: "arm-svgrepo-com",
        titel: 'Force',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc force = UnitconversionBloc();
            force.add(UnitconversionInitial(forceApi[0], forceApi[1]));
            return force;
          },
          child: ConversionScreen(forceApi, 'Force'),
        ),
      ),
      Property(
        boximage: "manometer-svgrepo-com",
        titel: 'Pressure',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc pressure = UnitconversionBloc();
            pressure.add(UnitconversionInitial(pressureApi[0], pressureApi[1]));
            return pressure;
          },
          child: ConversionScreen(pressureApi, 'Pressure'),
        ),
      ),
      Property(
        boximage: "cube-sugar-2-svgrepo-com",
        titel: 'Density',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc density = UnitconversionBloc();
            density.add(UnitconversionInitial(densityApi[0], densityApi[1]));
            return density;
          },
          child: ConversionScreen(densityApi, 'Density'),
        ),
      ),
      Property(
        boximage: "scales-3-svgrepo-com",
        titel: 'Amount of substance',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc amountofsubstance = UnitconversionBloc();
            amountofsubstance.add(UnitconversionInitial(
                amountofsubstanceApi[0], amountofsubstanceApi[1]));
            return amountofsubstance;
          },
          child: ConversionScreen(amountofsubstanceApi, 'Amount of substance'),
        ),
      ),
      Property(
        boximage: "molecule-svgrepo-com",
        titel: 'Molar mass',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc molarmass = UnitconversionBloc();
            molarmass
                .add(UnitconversionInitial(molarmassApi[0], molarmassApi[1]));
            return molarmass;
          },
          child: ConversionScreen(molarmassApi, 'Molar mass'),
        ),
      ),
      Property(
        boximage: "angel-45-svgrepo-com",
        titel: 'Angle',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc angle = UnitconversionBloc();
            angle.add(UnitconversionInitial(anglesApi[0], anglesApi[1]));
            return angle;
          },
          child: ConversionScreen(anglesApi, 'Angle'),
        ),
      ),
      Property(
        boximage: "battery-charging-svgrepo-com",
        titel: 'Energy',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc energ = UnitconversionBloc();
            energ.add(UnitconversionInitial(energyApi[0], energyApi[1]));
            return energ;
          },
          child: ConversionScreen(energyApi, 'Energy'),
        ),
      ),
      Property(
        boximage: "power-svgrepo-com",
        titel: 'Power',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc power = UnitconversionBloc();
            power.add(UnitconversionInitial(powerAPi[0], powerAPi[1]));
            return power;
          },
          child: ConversionScreen(powerAPi, 'Power'),
        ),
      ),
      Property(
        boximage: "data-center-data-warehouse-svgrepo-com",
        titel: 'Digital Data',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc storage = UnitconversionBloc();
            storage.add(
                UnitconversionInitial(digitaldataApi[0], digitaldataApi[1]));
            return storage;
          },
          child: ConversionScreen(digitaldataApi, 'Digital Data'),
        ),
      ),
      Property(
        boximage: "shoe-5-svgrepo-com",
        titel: 'Shoe size',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc shoesize = UnitconversionBloc();
            shoesize.add(UnitconversionInitial(shoesizeApi[0], shoesizeApi[1]));
            return shoesize;
          },
          child: ConversionScreen(shoesizeApi, 'Shoe size'),
        ),
      ),
      Property(
        boximage: "s-svgrepo-com",
        titel: 'SI prefixes',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc sIprefixes = UnitconversionBloc();
            sIprefixes
                .add(UnitconversionInitial(sIprefixesApi[0], sIprefixesApi[1]));
            return sIprefixes;
          },
          child: ConversionScreen(sIprefixesApi, 'SI prefixes'),
        ),
      ),
      Property(
        boximage: "wrench-svgrepo-com",
        titel: 'Torque',
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc torque = UnitconversionBloc();
            torque.add(UnitconversionInitial(torqueApi[0], torqueApi[1]));
            return torque;
          },
          child: ConversionScreen(torqueApi, 'Torque'),
        ),
      ),
    ];
  }

  List<Widget> property() {
    return [
      const Property(
        boximage: "body-mass-index-svgrepo-com",
        titel: 'BMI',
        newpage: BmiScreen(),
      ),
      Property(
        boximage: "birthday-cake-celebration-gift-party-pastry-svgrepo-com",
        titel: 'Age',
        newpage: BlocProvider(
          create: (context) => AgeBloc(),
          child: const AgeScreen(),
        ),
      ),
      Property(
        boximage: "score-svgrepo-com",
        titel: 'GPA',
        newpage: BlocProvider(
          create: (context) => GpaBloc(GpaStateComplet([], 0, 0)),
          child: const GpaScreen(),
        ),
      )
    ];
  }

  void nextpage(BuildContext context, Widget newpage) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return newpage;
    }));
  }

//------------------------------------------------------------------------------------
}
