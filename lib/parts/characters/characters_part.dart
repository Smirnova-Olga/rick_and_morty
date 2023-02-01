library characters_part;

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/domain/api_clients/api_client.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

part 'bloc/characters_bloc.dart';
part 'bloc/characters_event.dart';
part 'bloc/characters_state.dart';
part '../../screens/characters_screen.dart';
part 'models/character.dart';

part 'characters_part.g.dart';

class CharactersPart extends StatelessWidget {
  const CharactersPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharactersBloc>(
      create: (context) => CharactersBloc(ApiClient())..add(CharactersOpened()),
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoadFailure) {
            return Container();
          } else if (state is CharactersLoadSuccess) {
            return CharactersScreen(
              characters: state.characters,
              isList: state.isList,
            );
          } else {
            return const AppLoadingScreen();
          }
        },
      ),
    );
  }
}
