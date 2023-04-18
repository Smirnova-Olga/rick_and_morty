import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/parts/auth/auth_repository.dart';
import 'package:rick_and_morty/parts/auth/bloc/auth_bloc.dart';
import 'package:rick_and_morty/parts/home/home_part.dart';
import 'package:rick_and_morty/parts/theme/cubit/theme_cubit.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                authRepository:
                    RepositoryProvider.of<AuthRepository>(context))),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rick&Morty',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: state,
            darkTheme: ColorTheme.darkTheme,
            home: const HomeScreen(),
            // home: const FirebaseStream(),
          );
        },
      ),
    );
  }
}
