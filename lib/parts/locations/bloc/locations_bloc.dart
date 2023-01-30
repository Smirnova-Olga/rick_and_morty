part of '../locations_part.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc() : super(LocationsInitial()) {
    on(_onLocationsOpened);
  }

  Future<void> _onLocationsOpened(
      LocationsOpened event, Emitter<LocationsState> emit) async {
    emit(LocationsLoadSuccess(locations: locations));
  }
}
