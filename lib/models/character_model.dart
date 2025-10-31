
import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final bool isFavorite;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    this.isFavorite = false,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  CharacterModel copyWith({bool? isFavorite}) {
    return CharacterModel(
      id: id,
      name: name,
      status: status,
      species: species,
      gender: gender,
      image: image,
      isFavorite: isFavorite ?? this.isFavorite, 
    );
  }
}
