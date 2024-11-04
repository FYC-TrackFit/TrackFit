// models/type_exercice.dart

import 'categorie_exercice.dart';

class TypeExercice {
  final int id;
  final String libelle;
  final int objectifDuree; // Correspond à `objectifDurre` côté backend
  final int objectifCalorie; // Correspond à `objectifCalorique`
  final int? repetition;
  final CategorieExercice categorieExercice;

  TypeExercice({
    required this.id,
    required this.libelle,
    required this.objectifDuree,
    required this.objectifCalorie,
    this.repetition,
    required this.categorieExercice,
  });

  factory TypeExercice.fromJson(Map<String, dynamic> json) {
    return TypeExercice(
      id: json['id'],
      libelle: json['libelle'],
      objectifDuree: json['objectifDurre'],
      objectifCalorie: json['objectifCalorique'],
      repetition: json['repetition'],
      categorieExercice: CategorieExercice.fromJson(json['categorieExerciceResponse']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
      'objectifDurre': objectifDuree,
      'objectifCalorique': objectifCalorie,
      'repetition': repetition,
      'categorieExerciceResponse': categorieExercice.toJson(),
    };
  }
}