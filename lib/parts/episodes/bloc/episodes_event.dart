part of '../episodes_part.dart';

abstract class EpisodesEvent {}

class EpisodesOpened extends EpisodesEvent {}

class EpisodesSeasonsSwitched extends EpisodesEvent {}

class SearchEpisodeByName extends EpisodesEvent {
  final String name;

  SearchEpisodeByName(this.name);
}
