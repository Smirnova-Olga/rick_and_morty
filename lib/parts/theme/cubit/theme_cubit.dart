import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());
  void toggleTheme() {
    if (state == ThemeData.light()) {
      emit(ThemeData.dark());
    } else {
      emit(ThemeData.light());
    }
  }

  ThemeData getThemeData() => state;
}
