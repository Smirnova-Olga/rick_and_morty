part of '../characters_part.dart';

abstract class CharactersEvent {}

class CharactersOpened extends CharactersEvent {}

class CharactersViewSwitched extends CharactersEvent {}

class CharactersSearched extends CharactersEvent {
  final String searchedText;

  CharactersSearched(this.searchedText);
}
