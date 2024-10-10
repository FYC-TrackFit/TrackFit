import 'categorie_exercice.dart';
import 'package:flutter/material.dart';

class TypeExercice {
  final int id;
  final String libelle;
  final Duration objectifDuree;
  final int objectifCalorie;
  final CategorieExercice categorieExercice;
  final IconData iconType;

  TypeExercice({
    required this.id,
    required this.libelle,
    required this.objectifDuree,
    required this.objectifCalorie,
    required this.categorieExercice,
    required this.iconType,
  });
}