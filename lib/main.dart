import 'dart:async';

import 'package:adivery/adivery.dart';
import 'package:calculator/bloc/calculator/calculator_event.dart';

import 'package:calculator/bloc/theme/theme_bloc.dart';
import 'package:calculator/bloc/theme/theme_event.dart';
import 'package:calculator/bloc/theme/theme_state.dart';
import 'package:calculator/theme/theme.dart';
import 'package:calculator/view/calculator_screen.dart';
import 'package:calculator/view/capabilities_screen.dart';
import 'package:calculator/view/setting_screen.dart';
import 'package:calculator/widgets/prepare_interstitial_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'bloc/calculator/calculator_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdiveryPlugin.initialize('8da5622e-3eb1-4bb7-9bcc-4e722d63c5e9');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var themeBloc = ThemeBloc();
        themeBloc.add(InitThemeEvent());
        return themeBloc;
      },
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state.mode,
            theme: AppTheme.lighttheme,
            darkTheme: AppTheme.darktheme,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? tabcontrol;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    tabcontrol = TabController(length: 2, vsync: this);
    AdiveryPlugin.prepareInterstitialAd('b27de982-c95c-4adf-b865-0b3720e32517');
    timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      showInterstitial();
      timer.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: TabBarwidget(tabcontrol),
        leadingWidth: 60,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const SettingScreen();
              },
            ));
          },
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              if (state.mode == ThemeMode.dark) {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context).add(LightThemeEvent());
                  },
                  icon: Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).iconTheme.color,
                  ),
                );
              } else {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context).add(DarkThemeEvent());
                  },
                  icon: Icon(
                    Icons.light_mode,
                    color: Theme.of(context).iconTheme.color,
                  ),
                );
              }
            },
          ),
          const Gap(15),
        ],
      ),
//--------------------- tabbar view body ---------------------------------------
      body: SafeArea(
        child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabcontrol,
            children: [
//------------ calculator page -------------------------------------------------
              BlocProvider(
                create: (context) {
                  var bloc = CalculatorBloc();
                  bloc.add(CalculatorEventInitial());
                  return bloc;
                },
                child: const CalculatorScreen(),
              ),
//------------ capabilities page -----------------------------------------------
              const SecoundScreen(),
            ]),
      ),
    );
//------------------------------------------------------------------------------
  }
}

//------------------- TabBarwidget create tabbarview ---------------------------
// ignore: must_be_immutable
class TabBarwidget extends StatelessWidget {
  TabBarwidget(this.tabcontrol, {super.key});
  TabController? tabcontrol;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabcontrol,
      physics: const NeverScrollableScrollPhysics(),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return states.contains(MaterialState.focused)
              ? null
              : Colors.transparent;
        },
      ),
      splashBorderRadius: BorderRadius.circular(1000),
      indicatorColor: Colors.transparent,
      labelColor: Theme.of(context).primaryColor,
      dividerColor: Colors.transparent,
      unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
      tabs: const [
        Tab(
          icon: Icon(
            Icons.calculate_outlined,
            size: 26,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.category_outlined,
            size: 26,
          ),
        ),
      ],
    );
  }
}
//------------------------------------------------------------------------------
