import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/parts/auth/auth_repository.dart';
import 'package:rick_and_morty/parts/auth/bloc/auth_bloc.dart';
import 'package:rick_and_morty/parts/home/home_part.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick&Morty',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: ColorTheme.white000ForDark,
              elevation: 0,
              selectedItemColor: ColorTheme.greenDark,
              unselectedItemColor: ColorTheme.backgroundDark,
              showUnselectedLabels: true,
            ),
          ),
          darkTheme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: ColorTheme.greyDark,
              elevation: 0,
              selectedItemColor: ColorTheme.greenDark,
              unselectedItemColor: ColorTheme.white100Dark,
              showUnselectedLabels: true,
            ),
          ),
          home: const HomeScreen(),
          // home: const FirebaseStream(),
        ),
      ),
    );
  }
}
