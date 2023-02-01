part of '../locations_part.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  final ApiClient apiClient;
  LocationsBloc(this.apiClient) : super(LocationsInitial()) {
    on(_onLocationsOpened);
  }

  Future<void> _onLocationsOpened(
      LocationsOpened event, Emitter<LocationsState> emit) async {
    final locationList = await apiClient.fetchLocations();
    emit(LocationsLoadSuccess(locations: locationList));
  }
}
