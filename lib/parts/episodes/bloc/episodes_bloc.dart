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
    emit(EpisodesLoadSuccess(episodes: episodeList));
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
      EpisodesSearched event, Emitter<EpisodesState> emit) async {
    // TODO: add realization
  }
}
