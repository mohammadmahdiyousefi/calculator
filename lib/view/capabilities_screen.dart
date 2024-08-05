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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/unitconversion/unitconversion_bloc.dart';

//capabilities_screen
class CapabilitiesScreen extends StatelessWidget {
  const CapabilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localText = AppLocalizations.of(context)!;

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
                        localText.unitConvert,
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
                Wrap(children: units(localText)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        localText.utilitytools,
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
                Wrap(children: property(localText)),
                creatabannerad(BannerAdSize.BANNER) ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> units(AppLocalizations localText) {
    return [
      Property(
        boximage: "ruler",
        titel: localText.length,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc length = UnitconversionBloc();
            length.add(UnitconversionInitial(lengthApi[0], lengthApi[1]));
            return length;
          },
          child: ConversionScreen(lengthApi, localText.length),
        ),
      ),
      Property(
        boximage: "rectangle-2-svgrepo-com",
        titel: localText.area,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc area = UnitconversionBloc();
            area.add(UnitconversionInitial(areaApi[0], areaApi[1]));
            return area;
          },
          child: ConversionScreen(areaApi, localText.area),
        ),
      ),
      Property(
        boximage:
            "bottle-of-glass-with-massage-oil-of-aromatherapy-for-spa-svgrepo-com",
        titel: localText.volume,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc volume = UnitconversionBloc();
            volume.add(UnitconversionInitial(volumeApi[0], volumeApi[1]));
            return volume;
          },
          child: ConversionScreen(volumeApi, localText.volume),
        ),
      ),
      Property(
        boximage: "clock-svgrepo-com",
        titel: localText.time,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc time = UnitconversionBloc();
            time.add(UnitconversionInitial(timeApi[0], timeApi[1]));
            return time;
          },
          child: ConversionScreen(timeApi, localText.time),
        ),
      ),
      Property(
        boximage: "temperature-half-svgrepo-com",
        titel: localText.temperature,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc tempetature = UnitconversionBloc();
            tempetature.add(
                UnitconversionInitial(tempetatureApi[0], tempetatureApi[1]));
            return tempetature;
          },
          child: ConversionScreen(tempetatureApi, localText.temperature),
        ),
      ),
      Property(
        boximage: "speed-control-of-semicircular-shape-svgrepo-com",
        titel: localText.speed,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc speed = UnitconversionBloc();
            speed.add(UnitconversionInitial(speedApi[0], speedApi[1]));
            return speed;
          },
          child: ConversionScreen(speedApi, localText.speed),
        ),
      ),
      Property(
        boximage: "weight-svgrepo-com",
        titel: localText.mass,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc mass = UnitconversionBloc();
            mass.add(UnitconversionInitial(massApi[0], massApi[1]));
            return mass;
          },
          child: ConversionScreen(massApi, localText.mass),
        ),
      ),
      Property(
        boximage: "newtons-cradle-svgrepo-com",
        titel: localText.force,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc force = UnitconversionBloc();
            force.add(UnitconversionInitial(forceApi[0], forceApi[1]));
            return force;
          },
          child: ConversionScreen(forceApi, localText.force),
        ),
      ),
      Property(
        boximage: "pressure-alt-svgrepo-com",
        titel: localText.preassure,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc pressure = UnitconversionBloc();
            pressure.add(UnitconversionInitial(pressureApi[0], pressureApi[1]));
            return pressure;
          },
          child: ConversionScreen(pressureApi, localText.preassure),
        ),
      ),
      Property(
        boximage: "cube-sugar-2-svgrepo-com",
        titel: localText.density,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc density = UnitconversionBloc();
            density.add(UnitconversionInitial(densityApi[0], densityApi[1]));
            return density;
          },
          child: ConversionScreen(densityApi, localText.density),
        ),
      ),
      Property(
        boximage: "scales-3-svgrepo-com",
        titel: localText.amountofsubstance,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc amountofsubstance = UnitconversionBloc();
            amountofsubstance.add(UnitconversionInitial(
                amountofsubstanceApi[0], amountofsubstanceApi[1]));
            return amountofsubstance;
          },
          child: ConversionScreen(
              amountofsubstanceApi, localText.amountofsubstance),
        ),
      ),
      Property(
        boximage: "molecule-svgrepo-com",
        titel: localText.molarmass,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc molarmass = UnitconversionBloc();
            molarmass
                .add(UnitconversionInitial(molarmassApi[0], molarmassApi[1]));
            return molarmass;
          },
          child: ConversionScreen(molarmassApi, localText.molarmass),
        ),
      ),
      Property(
        boximage: "angel-45-svgrepo-com",
        titel: localText.angle,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc angle = UnitconversionBloc();
            angle.add(UnitconversionInitial(anglesApi[0], anglesApi[1]));
            return angle;
          },
          child: ConversionScreen(anglesApi, localText.angle),
        ),
      ),
      Property(
        boximage: "battery-charging-svgrepo-com",
        titel: localText.energy,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc energ = UnitconversionBloc();
            energ.add(UnitconversionInitial(energyApi[0], energyApi[1]));
            return energ;
          },
          child: ConversionScreen(energyApi, localText.energy),
        ),
      ),
      Property(
        boximage: "power-svgrepo-com",
        titel: localText.power,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc power = UnitconversionBloc();
            power.add(UnitconversionInitial(powerAPi[0], powerAPi[1]));
            return power;
          },
          child: ConversionScreen(powerAPi, localText.power),
        ),
      ),
      Property(
        boximage: "data-center-data-warehouse-svgrepo-com",
        titel: localText.digitaldate,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc storage = UnitconversionBloc();
            storage.add(
                UnitconversionInitial(digitaldataApi[0], digitaldataApi[1]));
            return storage;
          },
          child: ConversionScreen(digitaldataApi, localText.digitaldate),
        ),
      ),
      Property(
        boximage: "shoe-5-svgrepo-com",
        titel: localText.shoesize,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc shoesize = UnitconversionBloc();
            shoesize.add(UnitconversionInitial(shoesizeApi[0], shoesizeApi[1]));
            return shoesize;
          },
          child: ConversionScreen(shoesizeApi, localText.shoesize),
        ),
      ),
      Property(
        boximage: "s-svgrepo-com",
        titel: localText.siprefixes,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc sIprefixes = UnitconversionBloc();
            sIprefixes
                .add(UnitconversionInitial(sIprefixesApi[0], sIprefixesApi[1]));
            return sIprefixes;
          },
          child: ConversionScreen(sIprefixesApi, localText.siprefixes),
        ),
      ),
      Property(
        boximage: "wrench-svgrepo-com",
        titel: localText.torque,
        newpage: BlocProvider(
          create: (context) {
            final UnitconversionBloc torque = UnitconversionBloc();
            torque.add(UnitconversionInitial(torqueApi[0], torqueApi[1]));
            return torque;
          },
          child: ConversionScreen(torqueApi, localText.torque),
        ),
      ),
    ];
  }

  List<Widget> property(AppLocalizations localText) {
    return [
      Property(
        boximage: "body-mass-index-svgrepo-com",
        titel: localText.bmi,
        newpage: const BmiScreen(),
      ),
      Property(
        boximage: "birthday-cake-celebration-gift-party-pastry-svgrepo-com",
        titel: localText.age,
        newpage: BlocProvider(
          create: (context) => AgeBloc(),
          child: const AgeScreen(),
        ),
      ),
      Property(
        boximage: "score-svgrepo-com",
        titel: localText.gpa,
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
}
