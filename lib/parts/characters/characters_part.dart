library characters_part;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:rick_and_morty/parts/characters/mock_data/mock_data.dart';

part 'bloc/characters_bloc.dart';
part 'bloc/characters_event.dart';
part 'bloc/characters_state.dart';
part 'characters_screen.dart';
part 'models/character.dart';

class CharactersPart extends StatelessWidget {
  const CharactersPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharactersBloc>(
      create: (context) => CharactersBloc()..add(CharactersOpened()),
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
