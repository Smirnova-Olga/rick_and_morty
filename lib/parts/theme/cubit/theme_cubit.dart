import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  static const _themePrefKey = 'theme';

  ThemeCubit() : super(ColorTheme.lightTheme) {
    _loadTheme();
  }

  void toggleTheme() async {
    if (state == ColorTheme.lightTheme) {
      emit(ColorTheme.darkTheme);
    } else {
      emit(ColorTheme.lightTheme);
    }
    await _saveTheme(state);
  }

  ThemeData getThemeData() => state;

  Future<void> _saveTheme(ThemeData theme) async {
    final prefs = await SharedPreferences.getInstance();
    if (theme == ColorTheme.lightTheme) {
      await prefs.setString(_themePrefKey, 'light');
    } else {
      await prefs.setString(_themePrefKey, 'dark');
    }
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themePref = prefs.getString(_themePrefKey);
    if (themePref == 'dark') {
      emit(ColorTheme.darkTheme);
    } else {
      emit(ColorTheme.lightTheme);
    }
  }
}
