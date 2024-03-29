part of '../characters_part.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final ApiClient apiClient;
  CharactersBloc(this.apiClient) : super(CharactersInitial()) {
    on(_onCharactersOpened);
    on(_onCharactersViewSwitched);
    on(_onCharactersSearched);
  }

  Future<void> _onCharactersOpened(
      CharactersOpened event, Emitter<CharactersState> emit) async {
    final charactersList = await apiClient.fetchCharacters();
    emit(CharactersLoadSuccess(
      characters: charactersList,
      isList: true,
      defaultCharacters: charactersList,
    ));
  }

  Future<void> _onCharactersViewSwitched(
      CharactersViewSwitched event, Emitter<CharactersState> emit) async {
    if (state is CharactersLoadSuccess) {
      final currentState = state as CharactersLoadSuccess;
      emit(currentState.copyWith(isList: !currentState.isList));
    }
  }

  Future<void> _onCharactersSearched(
      SearchCharacterByName event, Emitter<CharactersState> emit) async {
    if (state is CharactersLoadSuccess) {
      final currentState = state as CharactersLoadSuccess;

      if (event.name.isNotEmpty) {
        final searchedCharacters = currentState.defaultCharacters
            .where((character) =>
                character.name.toLowerCase().contains(event.name.toLowerCase()))
            .toList();
        emit(currentState.copyWith(
          characters: searchedCharacters,
          isList: currentState.isList,
        ));
      } else {
        emit(currentState.copyWith(
          characters: currentState.defaultCharacters,
          isList: currentState.isList,
        ));
      }
    }
  }
}
