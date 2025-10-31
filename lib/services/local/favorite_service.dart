import 'dart:convert';

import 'package:flutter_rick_and_morty/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const _favoriteKey = 'favorites';

  Future<List<CharacterModel>> getCharacters() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString(_favoriteKey);
    if (jsonString == null) return [];
    final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
    return jsonList
        .map((json) => CharacterModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveCharacters(List<CharacterModel> favorites) async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = json.encode(
      favorites.map((character) => character.toJson()).toList(),
    );
    await pref.setString(_favoriteKey, jsonString);
  }

 Future<bool> toggleFavorite(CharacterModel character) async {
  final favorites = await getCharacters();
  final isAlreadyFavorite = favorites.any((char) => char.id == character.id);

  if (isAlreadyFavorite) {
    favorites.removeWhere((char) => char.id == character.id);
  } else {
    favorites.add(character.copyWith(isFavorite: true));
  }
  await saveCharacters(favorites);
  return !isAlreadyFavorite; 
}

  Future<bool> isFavorite(int id) async {
    final favorites = await getCharacters();
    return favorites.any((fav) => fav.id == id);
  }
}
