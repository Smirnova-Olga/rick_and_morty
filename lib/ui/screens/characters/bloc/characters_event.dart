part of '../characters.dart';

abstract class CharactersEvent {}

class CharactersOpened extends CharactersEvent {}

class CharactersViewSwitched extends CharactersEvent {}

class CharactersSearched extends CharactersEvent {}
