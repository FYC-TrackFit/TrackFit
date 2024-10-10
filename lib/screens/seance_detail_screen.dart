import 'package:flutter/material.dart';
import '../models/seance.dart';
import '../widgets/exercise_card.dart';

class SeanceDetailScreen extends StatelessWidget {
  final Seance seance;

  const SeanceDetailScreen({Key? key, required this.seance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calcul de la durée totale et des calories totales
    final totalDuration = seance.exercices.fold(
      Duration.zero,
          (previousValue, element) => previousValue + element.dureeRealisee,
    );

    final totalCalories = seance.exercices.fold(
      0,
          (previousValue, element) => previousValue + element.caloriePerdue,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(seance.libelle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carte récapitulative de la séance
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Nom de la séance
                  Text(
                    seance.libelle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Détails de la séance
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Nombre d'exercices
                      Column(
                        children: [
                          Icon(Icons.fitness_center, color: Colors.purple[700]),
                          const SizedBox(height: 8),
                          Text(
                            '${seance.exercices.length} exercices',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple[900],
                            ),
                          ),
                        ],
                      ),
                      // Durée totale
                      Column(
                        children: [
                          Icon(Icons.timer, color: Colors.purple[700]),
                          const SizedBox(height: 8),
                          Text(
                            '${totalDuration.inMinutes} min',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple[900],
                            ),
                          ),
                        ],
                      ),
                      // Calories totales
                      Column(
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.purple[700]),
                          const SizedBox(height: 8),
                          Text(
                            '$totalCalories kcal',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple[900],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Liste des exercices de la séance
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: seance.exercices.length,
              itemBuilder: (context, index) {
                final exercise = seance.exercices[index];
                return ExerciseCard(exercise: exercise);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}