import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:rick_and_morty/screens/auth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick&Morty',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          selectedItemColor: ColorTheme.green,
          unselectedItemColor: ColorTheme.white100,
          showUnselectedLabels: true,
        ),
      ),
      home: const Scaffold(
        body: AuthScreen(),
      ),
    );
  }
}
