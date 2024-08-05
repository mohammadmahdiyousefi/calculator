abstract class ThemeEvent {}

class InitThemeEvent extends ThemeEvent {}

class LightThemeEvent extends ThemeEvent {}

class DarkThemeEvent extends ThemeEvent {}

class SystemThemeModeEvent extends ThemeEvent {}

class SetcolorEvent extends ThemeEvent {
  String color;
  SetcolorEvent(this.color);
}

class SetLanguage extends ThemeEvent {
  final String language;
  SetLanguage(this.language);
}
