import 'package:flutter/material.dart';

class CaloriesSummaryCard extends StatelessWidget {
  final int totalCalories;
  final int objectifCalories;
  final Color cardColor;

  const CaloriesSummaryCard({
    super.key,
    required this.totalCalories,
    this.objectifCalories = 10000,
    this.cardColor = const Color(0xFFCCDEC1), // Couleur verte claire par défaut
  });

  @override
  Widget build(BuildContext context) {
    double progress = (totalCalories / objectifCalories)
        .clamp(0.0, 1.0); // Calcul du pourcentage de progression

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: Card(
        elevation: 0, // Suppression de l'ombre
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Coins arrondis
        ),
        color: cardColor, // Couleur verte claire pour la carte
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const Text(
                'Calories',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      backgroundColor: Colors.white.withOpacity(
                          0.5), // Couleur plus légère pour l'arrière-plan
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.black, // Couleur du cercle blanc transparent
                      ),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        totalCalories >= objectifCalories
                            ? '$totalCalories'
                            : '${objectifCalories - totalCalories}',
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        totalCalories >= objectifCalories
                            ? '/$objectifCalories'
                            : 'restantes',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
