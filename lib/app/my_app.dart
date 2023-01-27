import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/ui/screens/auth/auth_screen_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          selectedItemColor: ColorTheme.green,
          unselectedItemColor: ColorTheme.white100,
          showUnselectedLabels: true,
        ),
      ),
      home: const Scaffold(
        body: AuthScreenWidget(),
      ),
    );
  }
}
