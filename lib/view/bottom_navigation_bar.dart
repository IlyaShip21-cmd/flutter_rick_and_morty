import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/core/theme/text_styles.dart';
import 'package:flutter_rick_and_morty/view/list_characters.dart';
import 'package:flutter_rick_and_morty/view/list_favorite.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _currentIndex = 0;

  Widget _listScreen(int index) {
    switch (index) {
      case 0:
        return ListCharacters();
      case 1:
        return ListFavorite();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Персонажи',),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        selectedLabelStyle: TextStyles.selectStyle(),
        unselectedLabelStyle: TextStyles.unSelectStyle(),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        
      ),
      body: _listScreen(_currentIndex),
    );
  }
}
