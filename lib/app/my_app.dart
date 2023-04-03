import 'package:flutter/material.dart';
import 'package:rick_and_morty/parts/home/home_part.dart';
import 'package:rick_and_morty/screens/create_account_screen.dart';
import 'package:rick_and_morty/screens/verify_email_screen.dart';
import 'package:rick_and_morty/services/firebase_stream.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:rick_and_morty/screens/auth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      // home: const Scaffold(
      //   body: AuthScreen(),
      // ),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/create_account': (context) => const CreateAccountScreen(),
        '/verify_email': (context) => const VerifyEmailScreen(),
      },
      initialRoute: '/',
    );
  }
}
