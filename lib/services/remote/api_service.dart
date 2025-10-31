import 'package:dio/dio.dart';
import 'package:flutter_rick_and_morty/models/character_model.dart';

class ApiService {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<CharacterModel>> getCharacters(int page) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/character',
        queryParameters: {'page': page},
      );

      final results = response.data['results'] as List<dynamic>;
      return results
          .map((json) => CharacterModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Ошибка: $e');
    }
  }
}
