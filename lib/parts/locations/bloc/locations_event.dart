part of '../locations_part.dart';

abstract class LocationsEvent {}

class LocationsOpened extends LocationsEvent {}

class SearchLocationByName extends LocationsEvent {
  final String name;

  SearchLocationByName(this.name);
}
