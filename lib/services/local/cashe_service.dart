import 'dart:convert';

import 'package:flutter_rick_and_morty/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CasheService {
  static const String _saveKey = 'characters_page_';

  Future<void> savePage(int page, List<CharacterModel> characters) async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = json.encode(characters.map((e) => e.toJson()).toList());
    await pref.setString('$_saveKey$page', jsonString);
  }

  Future<List<CharacterModel>> loadPage(int page) async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('$_saveKey$page');
    if (jsonString == null) return [];
    final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
    return jsonList
        .map((json) => CharacterModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
