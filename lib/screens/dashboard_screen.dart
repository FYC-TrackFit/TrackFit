import 'package:flutter/material.dart';
import '../widgets/calories_summary_card.dart';
import '../widgets/exercise_card.dart';
import '../models/exercice.dart';

class DashboardScreen extends StatelessWidget {
  // Données d'exemple pour les exercices
  final List<Exercice> exercises = [
    Exercice(
      id: 1,
      libelle: 'Course à pied',
      dureeRealisee: Duration(minutes: 30),
      caloriePerdue: 300,
      iconType: Icons.directions_run, // Icône pour la course à pied
    ),
    Exercice(
      id: 2,
      libelle: 'Cyclisme',
      dureeRealisee: Duration(minutes: 45),
      caloriePerdue: 400,
      iconType: Icons.directions_bike, // Icône pour le cyclisme
    ),
    Exercice(
      id: 3,
      libelle: 'Natation',
      dureeRealisee: Duration(minutes: 60),
      caloriePerdue: 500,
      iconType: Icons.pool, // Icône pour la natation
    ),
    Exercice(
      id: 4,
      libelle: 'Marche',
      dureeRealisee: Duration(minutes: 20),
      caloriePerdue: 150,
      iconType: Icons.directions_walk, // Icône pour la marche
    ),
    Exercice(
      id: 5,
      libelle: 'Musculation',
      dureeRealisee: Duration(minutes: 40),
      caloriePerdue: 350,
      iconType: Icons.fitness_center, // Icône pour la musculation
    ),
    Exercice(
      id: 6,
      libelle: 'Yoga',
      dureeRealisee: Duration(minutes: 50),
      caloriePerdue: 200,
      iconType: Icons.self_improvement, // Icône pour le yoga
    ),
    Exercice(
      id: 7,
      libelle: 'Tennis',
      dureeRealisee: Duration(minutes: 90),
      caloriePerdue: 600,
      iconType: Icons.sports_tennis, // Icône pour le tennis
    ),
    Exercice(
      id: 8,
      libelle: 'Basketball',
      dureeRealisee: Duration(minutes: 60),
      caloriePerdue: 500,
      iconType: Icons.sports_basketball, // Icône pour le basketball
    ),
    Exercice(
      id: 9,
      libelle: 'Football',
      dureeRealisee: Duration(minutes: 90),
      caloriePerdue: 700,
      iconType: Icons.sports_soccer, // Icône pour le football
    ),
    Exercice(
      id: 10,
      libelle: 'Boxe',
      dureeRealisee: Duration(minutes: 60),
      caloriePerdue: 650,
      iconType: Icons.sports_mma, // Icône pour la boxe
    ),
    Exercice(
      id: 11,
      libelle: 'Danse',
      dureeRealisee: Duration(minutes: 45),
      caloriePerdue: 300,
      iconType: Icons.music_note, // Icône pour la danse
    ),
    Exercice(
      id: 12,
      libelle: 'Escalade',
      dureeRealisee: Duration(minutes: 60),
      caloriePerdue: 700,
      iconType: Icons.terrain, // Icône pour l'escalade
    ),
    Exercice(
      id: 13,
      libelle: 'Ski',
      dureeRealisee: Duration(minutes: 120),
      caloriePerdue: 900,
      iconType: Icons.downhill_skiing, // Icône pour le ski
    ),
    Exercice(
      id: 14,
      libelle: 'Golf',
      dureeRealisee: const Duration(minutes: 90),
      caloriePerdue: 250,
      iconType: Icons.sports_golf, // Icône pour le golf
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Calcul du total des calories brûlées
    int totalCalories = exercises.fold(
        0, (previousValue, element) => previousValue + element.caloriePerdue);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CaloriesSummaryCard(totalCalories: totalCalories),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return ExerciseCard(exercise: exercises[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}