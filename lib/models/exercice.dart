import 'type_exercice.dart';

class Exercice {
  final int id;
  final String libelle;
  Duration dureeRealisee;
  int caloriePerdue;
  final TypeExercice typeExercice;

  Exercice({
    required this.id,
    required this.libelle,
    required this.dureeRealisee,
    required this.caloriePerdue,
    required this.typeExercice,
  });
}