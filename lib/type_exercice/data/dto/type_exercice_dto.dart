import 'package:flutter_project_app/categorie_exercice/data/dto/categorie_exercice_dto.dart';

class TypeExerciceDTO {
  final int id;
  final String libelle;
  final int objectifDurre;
  final int objectifCalorique;
  final int repetition;
  final CategorieExerciceDTO categorieExerciceResponse;

  const TypeExerciceDTO({
    required this.id,
    required this.libelle,
    required this.objectifDurre,
    required this.objectifCalorique,
    required this.repetition,
    required this.categorieExerciceResponse,
  });

  factory TypeExerciceDTO.fromJson(Map<String, dynamic> json) {
    return TypeExerciceDTO(
      id: json['id'],
      libelle: json['libelle'],
      objectifDurre: json['objectifDurre'],
      objectifCalorique: json['objectifCalorique'],
      repetition: json['repetition'],
      categorieExerciceResponse:
          CategorieExerciceDTO.fromJson(json['categorieExerciceResponse']),
    );
  }
}
