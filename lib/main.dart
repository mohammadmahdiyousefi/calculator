import 'package:adivery/adivery.dart';
import 'package:calculator/bloc/theme/theme_bloc.dart';
import 'package:calculator/bloc/theme/theme_event.dart';
import 'package:calculator/bloc/theme/theme_state.dart';
import 'package:calculator/theme/theme.dart';
import 'package:calculator/view/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdiveryPlugin.initialize('8da5622e-3eb1-4bb7-9bcc-4e722d63c5e9');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
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
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            locale: Locale(state.appLanguage),
            supportedLocales: const [
              Locale('fa', 'IR'),
              Locale('en', 'US'),
            ],
            home: const SwitchScreen(),
          );
        },
      ),
    );
  }
}
