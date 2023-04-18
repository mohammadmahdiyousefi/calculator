import 'package:adivery/adivery.dart';
import 'package:calculator/bloc/bmi/bmi_bloc.dart';
import 'package:calculator/bloc/bmi/bmi_state.dart';
import 'package:calculator/bloc/length/length_bloc.dart';
import 'package:calculator/bloc/length/length_state.dart';
import 'package:calculator/bloc/speed/speed_state.dart';
import 'package:calculator/bloc/tempetature/tempetature_bloc.dart';
import 'package:calculator/bloc/tempetature/tempetature_state.dart';
import 'package:calculator/bloc/time/time_bloc.dart';
import 'package:calculator/bloc/time/time_state.dart';
import 'package:calculator/service/local/Storage_local_api.dart';
import 'package:calculator/service/local/Tempetature_local)api.dart';
import 'package:calculator/service/local/area_local_api.dart';
import 'package:calculator/service/local/length_local_api.dart';
import 'package:calculator/service/local/speed_local_api.dart';
import 'package:calculator/service/local/time_local_api.dart';
import 'package:calculator/theme.dart';
import 'package:calculator/view/calculator_screen.dart';
import 'package:calculator/view/capabilities_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/Storage/Storage_bloc.dart';
import 'bloc/Storage/Storage_state.dart';
import 'bloc/area/area_bloc.dart';
import 'bloc/area/area_state.dart';
import 'bloc/calculator/calculator_bloc.dart';
import 'bloc/calculator/calculator_state.dart';
import 'bloc/speed/speed_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdiveryPlugin.initialize('8da5622e-3eb1-4bb7-9bcc-4e722d63c5e9');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) {
        return CalculatorBloc(CalculatorState(
          TextEditingController(text: ''),
          TextEditingController(text: '0'),
        ));
      },
    ),
    BlocProvider(
      create: (context) {
        return AreaBloc(AreaState(
            TextEditingController(text: '0'),
            AreaApi().getdata()[0],
            AreaApi().getdata()[0],
            TextEditingController(text: '0')));
      },
    ),
    BlocProvider(
      create: (context) {
        return StorageBloc(StorageState(
          TextEditingController(text: '0'),
          StorageApi().getdata()[0],
          StorageApi().getdata()[0],
          TextEditingController(text: '0'),
        ));
      },
    ),
    BlocProvider(
      create: (context) {
        return SpeedBloc(SpeedState(
            TextEditingController(text: '0'),
            SpeedApi().getdata()[0],
            SpeedApi().getdata()[0],
            TextEditingController(text: '0')));
      },
    ),
    BlocProvider(
      create: (context) {
        return LengthBloc(LengthState(
          TextEditingController(text: '0'),
          LengthApi().getdata()[0],
          LengthApi().getdata()[0],
          TextEditingController(text: '0'),
        ));
      },
    ),
    BlocProvider(
      create: (context) {
        return TimeBloc(TimeState(
            TextEditingController(text: '0'),
            TimeApi().getdata()[0],
            TimeApi().getdata()[0],
            TextEditingController(text: '0')));
      },
    ),
    BlocProvider(
      create: (context) {
        return TempetatureBloc(TempetatureState(
          TextEditingController(text: '0'),
          TempetatureApi().getdata()[0],
          TempetatureApi().getdata()[0],
          TextEditingController(text: '0'),
        ));
      },
    ),
    BlocProvider(
      create: (context) {
        return BmiBloc(BmiState(Colors.grey, '', '', 0));
      },
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //دارک تم کردن با سیستم
      themeMode: ThemeMode.system,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      home: const MainPage(),
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontrol = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: TabBarwidget(tabcontrol)),
      body: SafeArea(
        child: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: tabcontrol,
            children: [
              const HomeScreen(),
              SecoundScreen(),
            ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class TabBarwidget extends StatelessWidget {
  TabBarwidget(this.tabcontrol, {super.key});
  TabController? tabcontrol;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 6;
    return Container(
      margin: EdgeInsets.only(
        left: width,
        right: width,
      ),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: TabBar(
        controller: tabcontrol,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
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
        labelColor: Colors.orange,
        unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
        tabs: const [
          Tab(
            icon: Icon(Icons.calculate_outlined),
          ),
          Tab(
            icon: Icon(Icons.category_outlined),
          ),
        ],
      ),
    );
  }
}
