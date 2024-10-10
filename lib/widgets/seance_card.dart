import 'package:flutter/material.dart';
import '../models/seance.dart';
import '../screens/seance_detail_screen.dart'; // Import de la nouvelle page

class SeanceCard extends StatelessWidget {
  final Seance seance;

  const SeanceCard({Key? key, required this.seance}) : super(key: key);

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

    return GestureDetector(
      onTap: () {
        // Navigation vers SeanceDetailScreen en passant la séance sélectionnée
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SeanceDetailScreen(seance: seance),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icône représentant la séance
            Icon(
              Icons.event_note,
              size: 40,
              color: Colors.purple[800],
            ),
            const SizedBox(width: 16),
            // Colonne contenant les informations
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom de la séance
                  Text(
                    seance.libelle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Nombre d'exercices
                  Row(
                    children: [
                      Icon(Icons.fitness_center, color: Colors.purple[700]),
                      const SizedBox(width: 8),
                      Text(
                        '${seance.exercices.length} exercices',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple[900],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Durée totale
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.purple[700]),
                      const SizedBox(width: 8),
                      Text(
                        '${totalDuration.inMinutes} min',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple[900],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Calories totales
                  Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.purple[700]),
                      const SizedBox(width: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}