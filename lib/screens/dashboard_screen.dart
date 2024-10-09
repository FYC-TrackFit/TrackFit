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
        caloriePerdue: 300),
    Exercice(
        id: 2,
        libelle: 'Cyclisme',
        dureeRealisee: Duration(minutes: 45),
        caloriePerdue: 400),
  ];

  @override
  Widget build(BuildContext context) {
    // Calcul du total des calories brûlées
    int totalCalories = exercises.fold(
        0, (previousValue, element) => previousValue + element.caloriePerdue);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CaloriesSummaryCard(totalCalories: totalCalories),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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