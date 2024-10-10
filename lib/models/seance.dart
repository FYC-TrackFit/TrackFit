import 'exercice.dart';

class Seance {
  final int id;
  final String libelle;
  final DateTime date;
  final int objectifCalorie;
  final List<Exercice> exercices;

  Seance({
    required this.id,
    required this.libelle,
    required this.date,
    required this.objectifCalorie,
    required this.exercices,
  });
}