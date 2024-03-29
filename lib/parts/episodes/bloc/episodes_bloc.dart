part of '../episodes_part.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final ApiClient apiClient;
  EpisodesBloc(this.apiClient) : super(EpisodesInitial()) {
    on(_onEpisodesOpened);
    on(_onEpisodesSeasonsSwitched);
    on(_onEpisodesSearched);
  }

  Future<void> _onEpisodesOpened(
      EpisodesOpened event, Emitter<EpisodesState> emit) async {
    final episodeList = await apiClient.fetchEpisodes();
    emit(EpisodesLoadSuccess(
        episodes: episodeList, defaultEpisodes: episodeList));
  }

  Future<void> _onEpisodesSeasonsSwitched(
      EpisodesSeasonsSwitched event, Emitter<EpisodesState> emit) async {
    if (state is EpisodesLoadSuccess) {
      final currentState = state as EpisodesLoadSuccess;
      // TODO switched
      emit(currentState.copyWith());
    }
  }

  Future<void> _onEpisodesSearched(
      SearchEpisodeByName event, Emitter<EpisodesState> emit) async {
    if (state is EpisodesLoadSuccess) {
      final currentState = state as EpisodesLoadSuccess;
      if (event.name.isNotEmpty) {
        final searchedEpisodes = currentState.defaultEpisodes
            .where((episode) =>
                episode.name.toLowerCase().contains(event.name.toLowerCase()))
            .toList();
        emit(currentState.copyWith(episodes: searchedEpisodes));
      } else {
        emit(currentState.copyWith(episodes: currentState.defaultEpisodes));
      }
    }
  }
}
