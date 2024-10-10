import 'package:flutter/material.dart';
import '../widgets/calories_summary_card.dart';
import '../widgets/exercise_card.dart';
import '../models/exercice.dart';
import '../models/seance.dart';
import '../models/type_exercice.dart';
import '../models/categorie_exercice.dart';
import '../widgets/seance_card.dart'; // Import du widget SeanceCard

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key}) {
    initializeData();
  }

  // Données d'exemple pour les catégories d'exercice
  final CategorieExercice cardioCategory = CategorieExercice(
    id: 1,
    libelle: 'Cardio',
  );

  final CategorieExercice strengthCategory = CategorieExercice(
    id: 2,
    libelle: 'Musculation',
  );

  // Données d'exemple pour les types d'exercice
  late final TypeExercice runningType;
  late final TypeExercice cyclingType;
  late final TypeExercice swimmingType;
  late final TypeExercice walkingType;

  // Liste des exercices
  final List<Exercice> exercises = [];

  // Liste des séances
  final List<Seance> seances = [];

  void initializeData() {
    // Initialisation des types d'exercice
    runningType = TypeExercice(
      id: 1,
      libelle: 'Course à pied',
      objectifDuree: const Duration(minutes: 30),
      objectifCalorie: 300,
      categorieExercice: cardioCategory,
      iconType: Icons.directions_run,
    );

    cyclingType = TypeExercice(
      id: 2,
      libelle: 'Cyclisme',
      objectifDuree: const Duration(minutes: 45),
      objectifCalorie: 400,
      categorieExercice: cardioCategory,
      iconType: Icons.directions_bike,
    );

    swimmingType = TypeExercice(
      id: 3,
      libelle: 'Natation',
      objectifDuree: const Duration(minutes: 60),
      objectifCalorie: 500,
      categorieExercice: cardioCategory,
      iconType: Icons.pool,
    );

    walkingType = TypeExercice(
      id: 4,
      libelle: 'Marche',
      objectifDuree: const Duration(minutes: 20),
      objectifCalorie: 150,
      categorieExercice: cardioCategory,
      iconType: Icons.directions_walk,
    );

    // Initialisation des exercices
    final Exercice runningExercise = Exercice(
      id: 1,
      libelle: 'Course à pied',
      dureeRealisee: const Duration(minutes: 30),
      caloriePerdue: 300,
      typeExercice: runningType,
    );

    final Exercice cyclingExercise = Exercice(
      id: 2,
      libelle: 'Cyclisme',
      dureeRealisee: const Duration(minutes: 45),
      caloriePerdue: 400,
      typeExercice: cyclingType,
    );

    final Exercice swimmingExercise = Exercice(
      id: 3,
      libelle: 'Natation',
      dureeRealisee: const Duration(minutes: 60),
      caloriePerdue: 500,
      typeExercice: swimmingType,
    );

    final Exercice walkingExercise = Exercice(
      id: 4,
      libelle: 'Marche',
      dureeRealisee: const Duration(minutes: 20),
      caloriePerdue: 150,
      typeExercice: walkingType,
    );

    exercises.addAll([
      runningExercise,
      cyclingExercise,
      swimmingExercise,
      walkingExercise,
    ]);

    // Initialisation des séances
    final Seance seance1 = Seance(
      id: 1,
      libelle: 'Séance Matinale',
      date: DateTime.now(),
      objectifCalorie: 700,
      exercices: [runningExercise, cyclingExercise],
    );

    final Seance seance2 = Seance(
      id: 2,
      libelle: 'Séance de l\'Après-midi',
      date: DateTime.now(),
      objectifCalorie: 650,
      exercices: [swimmingExercise, walkingExercise],
    );

    seances.addAll([seance1, seance2]);
  }

  @override
  Widget build(BuildContext context) {
    // Calcul du total des calories brûlées
    int totalCalories = exercises.fold(
      0,
          (previousValue, element) => previousValue + element.caloriePerdue,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CaloriesSummaryCard(totalCalories: totalCalories),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Mes séances',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: seances.length,
              itemBuilder: (context, index) {
                return SeanceCard(seance: seances[index]);
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Mes exercices',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return ExerciseCard(exercise: exercises[index]);
              },
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}