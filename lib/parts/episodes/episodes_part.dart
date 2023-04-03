library episode_part;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/domain/api_clients/api_client.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

part 'bloc/episodes_bloc.dart';
part 'bloc/episodes_event.dart';
part 'bloc/episodes_state.dart';
part 'models/episode.dart';
part '../../screens/episodes_screen.dart';
part 'episodes_part.g.dart';

class EpisodesPart extends StatelessWidget {
  const EpisodesPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EpisodesBloc>(
      create: (context) => EpisodesBloc(ApiClient())..add(EpisodesOpened()),
      child: BlocBuilder<EpisodesBloc, EpisodesState>(
        builder: (context, state) {
          if (state is EpisodesLoadFailure) {
            return Container();
          } else if (state is EpisodesLoadSuccess) {
            return EpisodesScreen(episodes: state.episodes);
          } else {
            return const AppLoadingScreen();
          }
        },
      ),
    );
  }
}
