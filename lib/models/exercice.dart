import 'package:flutter/material.dart';

import 'type_exercice.dart';

class Exercice {
  final int id;
  final String libelle;
  final Duration dureeRealisee;
  final int caloriePerdue;
  final TypeExercice typeExercice;

  Exercice({
    required this.id,
    required this.libelle,
    required this.dureeRealisee,
    required this.caloriePerdue,
    required this.typeExercice,
  });
}