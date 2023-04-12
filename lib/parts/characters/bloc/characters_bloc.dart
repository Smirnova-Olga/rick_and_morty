part of '../characters_part.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final ApiClient apiClient;
  CharactersBloc(this.apiClient) : super(CharactersInitial()) {
    on(_onCharactersOpened);
    on(_onCharactersViewSwitched);
    on(_onCharactersSearched);
    on(_onCharactersNameChanged);
  }

  Future<void> _onCharactersOpened(
      CharactersOpened event, Emitter<CharactersState> emit) async {
    final charactersList = await apiClient.fetchCharacters();
    emit(CharactersLoadSuccess(characters: charactersList, isList: true));
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
      // List<Character> searchedCharacters = [];

      if (event.name.isNotEmpty) {
        final searchedCharacters = currentState.characters
            .where((character) =>
                character.name.toLowerCase().contains(event.name.toLowerCase()))
            .toList();
        emit(currentState.copyWith(
          characters: searchedCharacters,
          isList: currentState.isList,
        ));
      } else {
        // Если строка поиска пустая, то отобразить всех персонажей
        emit(currentState.copyWith(
          characters: List.from(currentState.characters),
          isList: currentState.isList,
        ));
      }
    }
  }

  Stream<CharactersState> _onCharactersNameChanged(
      CharactersNameChanged event, Emitter<CharactersState> emit) async* {
    add(SearchCharacterByName(event.name));
  }
}
