// models/seance.dart

import 'exercice.dart';
import 'sportif.dart';

class Seance {
  final int id;
  final String libelle;
  final DateTime date;
  final int objectifCalorie; // Correspond à `objectifCalorique`
  final Sportif sportif;
  final List<Exercice> exercices;

  Seance({
    required this.id,
    required this.libelle,
    required this.date,
    required this.objectifCalorie,
    required this.sportif,
    required this.exercices,
  });

  factory Seance.fromJson(Map<String, dynamic> json) {
    return Seance(
      id: json['id'],
      libelle: json['libelle'],
      date: DateTime.parse(json['date']),
      objectifCalorie: json['objectifCalorique'],
      sportif: Sportif.fromJson(json['sportifResponse']),
      exercices: (json['exercicesResponse'] as List)
          .map((e) => Exercice.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
      'date': date.toIso8601String(),
      'objectifCalorique': objectifCalorie,
      'sportifResponse': sportif.toJson(),
      'exercicesResponse': exercices.map((e) => e.toJson()).toList(),
    };
  }
}