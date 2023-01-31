part of '../episodes_part.dart';

abstract class EpisodesEvent {}

class EpisodesOpened extends EpisodesEvent {}

class EpisodesSearched extends EpisodesEvent {}

class EpisodesSeasonsSwitched extends EpisodesEvent {}
