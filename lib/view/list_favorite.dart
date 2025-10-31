import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/models/character_model.dart';
import 'package:flutter_rick_and_morty/viewModels/character_view_model.dart';
import 'package:flutter_rick_and_morty/widgets/character_card_widget.dart';
import 'package:flutter_rick_and_morty/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class ListFavorite extends StatelessWidget {
  const ListFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharacterViewModel>();
    final viewModelRead = context.read<CharacterViewModel>();
    final favorites = viewModel.favorites;
    final sortedFavorites = List<CharacterModel>.from(favorites)
      ..sort((a, b) => a.name.compareTo(b.name));
    final emptyStyle = TextStyle(
      color: Color.fromARGB(255, 54, 120, 244),
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(title: 'Избранные'),
        centerTitle: true,
      ),
      body: sortedFavorites.isEmpty
          ? Center(child: Text('Нет избранных', style: emptyStyle))
          : ListView.builder(
              itemCount: sortedFavorites.length,
              itemBuilder: (context, index) {
                final character = sortedFavorites[index];
                return CharacterCardWidget(
                  character: character,
                  onToggleFavorite: () =>
                      viewModelRead.toggleFavorite(character),
                );
              },
            ),
    );
  }
}
