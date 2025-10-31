import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/viewModels/character_view_model.dart';
import 'package:flutter_rick_and_morty/widgets/character_card_widget.dart';
import 'package:flutter_rick_and_morty/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class ListCharacters extends StatefulWidget {
  const ListCharacters({super.key});

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<CharacterViewModel>().loadCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharacterViewModel>();
    final viewModelRead = context.read<CharacterViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(title: 'Rick and Morty'),
        centerTitle: true,
      ),
      body: viewModel.characters.isEmpty && viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount:
                  viewModel.characters.length + (viewModel.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == viewModel.characters.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final character = viewModel.characters[index];
                return CharacterCardWidget(
                  character: character,
                  onToggleFavorite: () =>
                      viewModelRead.toggleFavorite(character),
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
