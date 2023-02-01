import 'package:dio/dio.dart';
import 'package:rick_and_morty/parts/characters/characters_part.dart';

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
}
