import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const LightThemeState(ThemeMode.light)) {
    on<InitThemeEvent>((event, emit) async {
      await getTheme().then((value) {
        if (value) {
          emit(const DarkThemeState(ThemeMode.dark));
        } else {
          emit(const LightThemeState(ThemeMode.light));
        }
      });
    });
    on<LightThemeEvent>((event, emit) async {
      await setTheme(false).then((value) {
        if (value) {
          emit(const LightThemeState(ThemeMode.light));
        } else {
          emit(const DarkThemeState(ThemeMode.dark));
        }
      });
    });
    on<DarkThemeEvent>((event, emit) async {
      await setTheme(true).then((value) {
        if (value) {
          emit(const DarkThemeState(ThemeMode.dark));
        } else {
          emit(const LightThemeState(ThemeMode.light));
        }
      });
    });
    on<SystemThemeModeEvent>((event, emit) async {});
  }
  Future<bool> setTheme(bool isdark) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool settheme = await prefs.setBool("Theme", isdark);
    return settheme;
  }

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool settheme = prefs.getBool("Theme") ?? false;
    return settheme;
  }
}
