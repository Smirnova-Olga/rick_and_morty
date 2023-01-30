part of '../characters.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on(_onCharactersOpened);
    on(_onCharactersViewSwitched);
    on(_onCharactersSearched);
  }

  Future<void> _onCharactersOpened(
      CharactersOpened event, Emitter<CharactersState> emit) async {
    emit(CharactersLoadSuccess(characters: characters, isList: true));
  }

  Future<void> _onCharactersViewSwitched(
      CharactersViewSwitched event, Emitter<CharactersState> emit) async {
    if (state is CharactersLoadSuccess) {
      final currentState = state as CharactersLoadSuccess;
      emit(currentState.copyWith(isList: !currentState.isList));
    }
  }

  Future<void> _onCharactersSearched(
      CharactersSearched event, Emitter<CharactersState> emit) async {
    emit(CharactersLoadSuccess(characters: characters, isList: true));
  }
}
