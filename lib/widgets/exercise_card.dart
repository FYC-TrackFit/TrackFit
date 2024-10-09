import 'package:flutter/material.dart';
import '../models/exercice.dart';

class ExerciseCard extends StatelessWidget {
  final Exercice exercise;

  ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Marges entre les éléments
      padding: EdgeInsets.all(16), // Padding interne
      decoration: BoxDecoration(
        color: Colors.orange[100], // Couleur de fond orange clair
        borderRadius: BorderRadius.circular(12), // Coins arrondis
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icône représentant le type de sport
          Icon(
            Icons.directions_bike, // Icône par défaut, vous pouvez le changer selon le sport
            size: 40,
            color: Colors.orange[800], // Couleur d'icône
          ),
          SizedBox(width: 16), // Espace entre l'icône et le texte
          // Colonne contenant les informations
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Première ligne : le nom de l'exercice
                Text(
                  exercise.libelle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[900],
                  ),
                ),
                SizedBox(height: 8), // Espace entre les lignes
                // Deuxième ligne : icône de flamme et calories brûlées
                Row(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.orange[700]),
                    SizedBox(width: 8),
                    Text(
                      '${exercise.caloriePerdue} kcal',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange[900],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8), // Espace entre les lignes
                // Troisième ligne : icône de minuterie et durée de l'exercice
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.orange[700]),
                    SizedBox(width: 8),
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
    );
  }
}