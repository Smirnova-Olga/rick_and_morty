part of '../characters.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on(_onCharactersOpened);
    on(_onCharactersViewSwitched);
  }

  Future<void> _onCharactersOpened(
      CharactersOpened event, Emitter<CharactersState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      emit(CharactersLoadSuccess(characters: characters, isList: true));
    });
  }

  Future<void> _onCharactersViewSwitched(
      CharactersViewSwitched event, Emitter<CharactersState> emit) async {
    if (state is CharactersLoadSuccess) {
      final currentState = state as CharactersLoadSuccess;
      emit(currentState.copyWith(isList: !currentState.isList));
    }
  }
}
