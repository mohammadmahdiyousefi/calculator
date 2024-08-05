import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';
import 'theme_state.dart';

/// Manages the app's theme and language settings.
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(const ThemeState(appLanguage: 'fa', mode: ThemeMode.light)) {
    on<InitThemeEvent>(_onInitThemeEvent);
    on<LightThemeEvent>(_onLightThemeEvent);
    on<DarkThemeEvent>(_onDarkThemeEvent);
    on<SystemThemeModeEvent>((event, emit) {});
    on<SetLanguage>(_onSetLanguageEvent);
  }

  /// Handles the initialization of the theme.
  Future<void> _onInitThemeEvent(
      InitThemeEvent event, Emitter<ThemeState> emit) async {
    final isDarkMode = await _getTheme();
    emit(state.copyWith(mode: isDarkMode ? ThemeMode.dark : ThemeMode.light));

    final language = await _getLanguage();
    emit(state.copyWith(appLanguage: language));
  }

  /// Handles switching to light theme.
  Future<void> _onLightThemeEvent(
      LightThemeEvent event, Emitter<ThemeState> emit) async {
    final isSuccess = await _setTheme(false);
    emit(state.copyWith(mode: isSuccess ? ThemeMode.light : ThemeMode.dark));
  }

  /// Handles switching to dark theme.
  Future<void> _onDarkThemeEvent(
      DarkThemeEvent event, Emitter<ThemeState> emit) async {
    final isSuccess = await _setTheme(true);
    emit(state.copyWith(mode: isSuccess ? ThemeMode.dark : ThemeMode.light));
  }

  /// Handles setting the app's language.
  Future<void> _onSetLanguageEvent(
      SetLanguage event, Emitter<ThemeState> emit) async {
    final isSuccess = await _setLanguage(event.language);
    if (isSuccess) {
      emit(state.copyWith(appLanguage: event.language));
    }
  }

  /// Sets the theme mode in shared preferences.
  Future<bool> _setTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool("Theme", isDarkMode);
  }

  /// Gets the current theme mode from shared preferences.
  Future<bool> _getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("Theme") ?? false;
  }

  /// Sets the app's language in shared preferences.
  Future<bool> _setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("Language", language);
  }

  /// Gets the current language from shared preferences.
  Future<String> _getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("Language") ?? "fa";
  }
}
