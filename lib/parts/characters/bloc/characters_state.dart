part of '../characters_part.dart';

abstract class CharactersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharactersInitial extends CharactersState {}

class CharactersLoadSuccess extends CharactersState {
  final List<Character> characters;
  final bool isList;

  CharactersLoadSuccess({
    required this.characters,
    required this.isList,
  });
  @override
  List<Object?> get props => [characters, isList];

  CharactersLoadSuccess copyWith({List<Character>? characters, bool? isList}) {
    return CharactersLoadSuccess(
        characters: characters ?? this.characters,
        isList: isList ?? this.isList);
  }
}

class CharactersLoadFailure extends CharactersState {}

class SearchInitial extends CharactersState {}

class SearchLoading extends CharactersState {}

class SearchSuccess extends CharactersState {
  final List<String> characters;

  SearchSuccess(this.characters);
}

class SearchFailure extends CharactersState {}
