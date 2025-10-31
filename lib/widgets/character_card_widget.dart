import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/core/extensions/extension_for_size.dart';
import 'package:flutter_rick_and_morty/core/theme/text_styles.dart';
import 'package:flutter_rick_and_morty/models/character_model.dart';

class CharacterCardWidget extends StatelessWidget {
  final CharacterModel character;
  final VoidCallback? onToggleFavorite;
  const CharacterCardWidget({
    super.key,
    required this.character,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(28)),
          child: Image.network(
            character.image,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 40);
            },
          ),
        ),
        title: Text(character.name, style: TextStyles.forTitle()),
        subtitle: Row(
          children: [
            Text(character.gender, style: TextStyles.forSubtitle()),
            5.vs,
            Text('-'),
            5.vs,
            Text(character.status, style: TextStyles.forSubtitle()),
          ],
        ),
        trailing: IconButton(
          onPressed: onToggleFavorite,

          icon: Icon(
            character.isFavorite ? Icons.star : Icons.star_outline,
            color: character.isFavorite ? Colors.amber : null,
          ),
        ),
      ),
    );
  }
}
