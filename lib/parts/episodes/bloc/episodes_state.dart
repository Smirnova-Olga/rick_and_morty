part of '../episodes_part.dart';

abstract class EpisodesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoadSuccess extends EpisodesState {
  final List<Episode> episodes;
  final List<Episode> defaultEpisodes;

  EpisodesLoadSuccess({required this.defaultEpisodes, required this.episodes});

  @override
  List<Object?> get props => [episodes, defaultEpisodes];

  EpisodesLoadSuccess copyWith(
      {List<Episode>? episodes, List<Episode>? defaultEpisodes}) {
    return EpisodesLoadSuccess(
      episodes: episodes ?? this.episodes,
      defaultEpisodes: defaultEpisodes ?? this.defaultEpisodes,
    );
  }
}

class EpisodesLoadFailure extends EpisodesState {}
