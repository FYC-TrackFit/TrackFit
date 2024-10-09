import 'package:flutter/material.dart';

class Exercice {
  final int id;
  final String libelle;
  final Duration dureeRealisee;
  final int caloriePerdue;
  final IconData iconType;

  Exercice({
    required this.id,
    required this.libelle,
    required this.dureeRealisee,
    required this.caloriePerdue,
    required this.iconType
  });
}