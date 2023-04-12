// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../characters_part.dart';

abstract class CharactersEvent {}

class CharactersOpened extends CharactersEvent {}

class CharactersViewSwitched extends CharactersEvent {}

class SearchCharacterByName extends CharactersEvent {
  final String name;

  SearchCharacterByName(this.name);
}
