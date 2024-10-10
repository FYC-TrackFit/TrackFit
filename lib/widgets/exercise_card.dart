import 'dart:ui'; // Import nécessaire pour ImageFilter
import 'package:flutter/material.dart';
import '../models/exercice.dart';

class ExerciseCard extends StatelessWidget {
  final Exercice exercise;

  ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Appeler la fonction pour afficher la popup
        _showExerciseDialog(context, exercise);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              exercise.typeExercice.iconType,
              size: 40,
              color: Colors.orange[800],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.libelle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[900],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.orange[700]),
                      const SizedBox(width: 8),
                      Text(
                        '${exercise.caloriePerdue} kcal',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange[900],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.orange[700]),
                      const SizedBox(width: 8),
                      Text(
                        '${exercise.dureeRealisee.inMinutes} min',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange[900],
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

  void _showExerciseDialog(BuildContext context, Exercice exercise) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Détails de l'exercice",
      barrierDismissible: true,
      barrierColor: Colors.transparent, // Rendre la barrière transparente pour appliquer le flou
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation1, animation2) {
        return Scaffold(
          backgroundColor: Colors.transparent, // Pour éviter une couleur de fond non désirée
          body: Stack(
            children: [
              // Arrière-plan flou
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5), // Ajouter un voile sombre semi-transparent
                ),
              ),
              // Contenu de la popup
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          exercise.libelle,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[900],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.local_fire_department, color: Colors.orange[700]),
                            const SizedBox(width: 8),
                            Text(
                              '${exercise.caloriePerdue} kcal',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange[800],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer, color: Colors.orange[700]),
                            const SizedBox(width: 8),
                            Text(
                              '${exercise.dureeRealisee.inMinutes} min',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange[800],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Fermer'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}