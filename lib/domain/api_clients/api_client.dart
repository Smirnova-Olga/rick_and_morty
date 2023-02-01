import 'package:dio/dio.dart';
import 'package:rick_and_morty/parts/characters/characters_part.dart';
import 'package:rick_and_morty/parts/episodes/episodes_part.dart';
import 'package:rick_and_morty/parts/locations/locations_part.dart';

class ApiClient {
  final _apiClient = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'),
  );

  Future<List<Character>> fetchCharacters() async {
    final result = await _apiClient.get<Map<String, dynamic>>('character');
    if (result.data != null) {
      final list = result.data!['results'] as List<dynamic>;
      final characters = list.map((e) => Character.fromJson(e)).toList();

      return characters;
    } else {
      return [];
    }
  }

  Future<List<Location>> fetchLocations() async {
    final result = await _apiClient.get<Map<String, dynamic>>('location');
    if (result.data != null) {
      final list = result.data!['results'] as List<dynamic>;
      final locations = list.map((e) => Location.fromJson(e)).toList();

      return locations;
    } else {
      return [];
    }
  }

  Future<List<Episode>> fetchEpisodes() async {
    final result = await _apiClient.get<Map<String, dynamic>>('episode');
    if (result.data != null) {
      final list = result.data!['results'] as List<dynamic>;
      final episode = list.map((e) => Episode.fromJson(e)).toList();

      return episode;
    } else {
      return [];
    }
  }
}
