import 'package:dio/dio.dart';

class ApiClient {
  Dio init() {
    return Dio(
      BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
    );
  }
}
