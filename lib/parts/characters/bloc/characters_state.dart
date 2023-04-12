part of '../characters_part.dart';

abstract class CharactersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharactersInitial extends CharactersState {}

class CharactersLoadSuccess extends CharactersState {
  final List<Character> characters;
  final bool isList;
  final List<Character> defaultCharacters;

  CharactersLoadSuccess({
    required this.defaultCharacters,
    required this.characters,
    required this.isList,
  });
  @override
  List<Object?> get props => [defaultCharacters, characters, isList];

  CharactersLoadSuccess copyWith({
    List<Character>? defaultCharacters,
    List<Character>? characters,
    bool? isList,
  }) {
    return CharactersLoadSuccess(
      characters: characters ?? this.characters,
      isList: isList ?? this.isList,
      defaultCharacters: defaultCharacters ?? this.defaultCharacters,
    );
  }
}

class CharactersLoadFailure extends CharactersState {}
