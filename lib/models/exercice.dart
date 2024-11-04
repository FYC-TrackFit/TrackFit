// models/exercice.dart

import 'type_exercice.dart';
import 'seance.dart';

class Exercice {
  final int id;
  final String libelle;
  int dureeRealisee; // Correspond à `durreRealise` côté backend
  int caloriePerdue; // Correspond à `caloriePerdus`
  final Seance? seance;
  final TypeExercice typeExercice;

  Exercice({
    required this.id,
    required this.libelle,
    required this.dureeRealisee,
    required this.caloriePerdue,
    this.seance,
    required this.typeExercice,
  });

  factory Exercice.fromJson(Map<String, dynamic> json) {
    return Exercice(
      id: json['id'],
      libelle: json['libelle'],
      dureeRealisee: json['durreRealise'],
      caloriePerdue: json['caloriePerdus'],
      seance: json['seanceResponse'] != null ? Seance.fromJson(json['seanceResponse']) : null,
      typeExercice: TypeExercice.fromJson(json['typeExerciceResponse']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
      'durreRealise': dureeRealisee,
      'caloriePerdus': caloriePerdue,
      'seanceResponse': seance?.toJson(),
      'typeExerciceResponse': typeExercice.toJson(),
    };
  }
}