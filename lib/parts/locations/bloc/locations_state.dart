// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../locations_part.dart';

abstract class LocationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationsInitial extends LocationsState {}

class LocationsLoadSuccess extends LocationsState {
  final List<Location> locations;
  final List<Location> defaultLocations;

  LocationsLoadSuccess({
    required this.locations,
    required this.defaultLocations,
  });
  @override
  List<Object?> get props => [locations, defaultLocations];

  LocationsLoadSuccess copyWith(
      {List<Location>? locations, List<Location>? defaultLocations}) {
    return LocationsLoadSuccess(
        locations: locations ?? this.locations,
        defaultLocations: defaultLocations ?? this.defaultLocations);
  }
}

class LocationsLoadFailure extends LocationsState {}
