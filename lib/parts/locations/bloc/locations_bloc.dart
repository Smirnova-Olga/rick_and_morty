part of '../locations_part.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  final ApiClient apiClient;
  LocationsBloc(this.apiClient) : super(LocationsInitial()) {
    on(_onLocationsOpened);
    on(_onLocationSearched);
  }

  Future<void> _onLocationsOpened(
      LocationsOpened event, Emitter<LocationsState> emit) async {
    final locationList = await apiClient.fetchLocations();
    emit(LocationsLoadSuccess(
        locations: locationList, defaultLocations: locationList));
  }

  Future<void> _onLocationSearched(
      SearchLocationByName event, Emitter<LocationsState> emit) async {
    if (state is LocationsLoadSuccess) {
      final currentState = state as LocationsLoadSuccess;

      if (event.name.isNotEmpty) {
        final searchedLocation = currentState.defaultLocations
            .where((location) =>
                location.name.toLowerCase().contains(event.name.toLowerCase()))
            .toList();
        emit(currentState.copyWith(locations: searchedLocation));
      } else {
        emit(currentState.copyWith(locations: currentState.defaultLocations));
      }
    }
  }
}
