part of '../episodes_part.dart';

abstract class EpisodesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoadSuccess extends EpisodesState {
  final List<Episode> episodes;

  EpisodesLoadSuccess({required this.episodes});

  @override
  List<Object?> get props => [episodes];

  EpisodesLoadSuccess copyWith({List<Episode>? episodes}) {
    return EpisodesLoadSuccess(
      episodes: episodes ?? this.episodes,
    );
  }
}

class EpisodesLoadFailure extends EpisodesState {}
