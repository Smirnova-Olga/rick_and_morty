import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ColorTheme.lightTheme);
  void toggleTheme() {
    if (state == ColorTheme.lightTheme) {
      emit(ColorTheme.darkTheme);
    } else {
      emit(ColorTheme.lightTheme);
    }
  }

  ThemeData getThemeData() => state;
}
