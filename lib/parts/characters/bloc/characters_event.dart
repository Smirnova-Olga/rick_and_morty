// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../characters_part.dart';

abstract class CharactersEvent {}

class CharactersOpened extends CharactersEvent {}

class CharactersViewSwitched extends CharactersEvent {}

class SearchEventLoadData extends CharactersEvent {
  final List<Character> characters;
  final List<Character> searchedCharacters;
  SearchEventLoadData(
      {required this.characters, required this.searchedCharacters});
}

class SearchEventPopSearch extends CharactersEvent {}
