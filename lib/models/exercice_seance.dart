import 'dart:async';
import 'exercice.dart';

enum ExerciceState { notStarted, running, paused, completed }

class ExerciceSeance {
  final Exercice exercice;
  int objectifCalorie;
  Duration tempsEcoule;
  ExerciceState state;
  Timer? timer;

  ExerciceSeance({
    required this.exercice,
    required this.objectifCalorie,
    this.tempsEcoule = Duration.zero,
    this.state = ExerciceState.notStarted,
  });
}