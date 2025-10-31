import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/app/my_app.dart';
import 'package:flutter_rick_and_morty/viewModels/character_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterViewModel(),
      child: const MyApp(),
    ),
  );
}
