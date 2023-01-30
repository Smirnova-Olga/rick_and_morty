// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../locations_part.dart';

abstract class LocationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationsInitial extends LocationsState {}

class LocationsLoadSuccess extends LocationsState {
  final List<Location> locations;

  LocationsLoadSuccess({
    required this.locations,
  });
  @override
  List<Object?> get props => [locations];

  LocationsLoadSuccess copyWith({List<Location>? locations}) {
    return LocationsLoadSuccess(locations: locations ?? this.locations);
  }
}

class LocationsLoadFailure extends LocationsState {}
