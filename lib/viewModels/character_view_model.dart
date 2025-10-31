import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/models/character_model.dart';
import 'package:flutter_rick_and_morty/services/local/cashe_service.dart';
import 'package:flutter_rick_and_morty/services/local/favorite_service.dart';
import 'package:flutter_rick_and_morty/services/remote/api_service.dart';

class CharacterViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final FavoriteService _favoriteService = FavoriteService();
  final CasheService _casheService = CasheService();

  final List<CharacterModel> _characters = [];
  List<CharacterModel> _favorites = [];
  bool _isLoading = false;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isFavoriteDirty = true;

  List<CharacterModel> get characters => _characters;
  List<CharacterModel> get favorites => _favorites;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  CharacterViewModel() {
    _loadFavorites();
    _loadInitial();
  }

  Future<void> loadCharacters() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;
    notifyListeners();

    try {
      List<CharacterModel> newCharacters;
      try {
        newCharacters = await _apiService.getCharacters(_currentPage);
        await _casheService.savePage(_currentPage, newCharacters);
      } catch (e) {
        newCharacters = await _casheService.loadPage(_currentPage);
        if (newCharacters.isEmpty) {
          throw Exception('Нет интернета');
        }
      }
      final updatedCharacters = await _syncFavoritesStatus(newCharacters);
      if (updatedCharacters.isEmpty) {
        _hasMore = false;
      } else {
        _characters.addAll(updatedCharacters);
        _currentPage++;
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(CharacterModel character) async {
    final newIsFavorite = await _favoriteService.toggleFavorite(character);
    final indexInCHaracters = _characters.indexWhere(
      (char) => char.id == character.id,
    );
    if (indexInCHaracters != -1) {
      _characters[indexInCHaracters] = character.copyWith(
        isFavorite: newIsFavorite,
      );
    }
    _isFavoriteDirty = true;

    await _loadFavorites();
    notifyListeners();

  }

  Future<void> _loadFavorites() async {
    if (_isFavoriteDirty) {
      _favorites = await _favoriteService.getCharacters();
      _isFavoriteDirty = false;
    }
  }

  Future<List<CharacterModel>> _syncFavoritesStatus(
    List<CharacterModel> characters,
  ) async {
    await _loadFavorites();
    return characters.map((character) {
      final isFavorite = _favorites.any((fav) => fav.id == character.id);
      return character.copyWith(isFavorite: isFavorite);
    }).toList();
  }

  Future<void> _loadInitial() async {
    if (characters.isEmpty) {
      await loadCharacters();
    }
  }
}
