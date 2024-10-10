import 'package:flutter/material.dart';
import 'package:flutter_project_app/models/categorie_exercice.dart';
import '../models/exercice.dart';
import '../models/exercice_seance.dart';
import '../models/seance.dart';
import '../models/type_exercice.dart';
import '../widgets/exercice_seance_card.dart';

class SeanceScreen extends StatefulWidget {
  const SeanceScreen({Key? key}) : super(key: key);

  @override
  _SeanceScreenState createState() => _SeanceScreenState();
}

class _SeanceScreenState extends State<SeanceScreen> {
  List<ExerciceSeance> exercicesSeance = [];
  String seanceLibelle = 'Nouvelle Séance';

  // Données d'exemple pour les types d'exercice (vous pouvez les récupérer de votre source de données réelle)
  final List<TypeExercice> typesExercicesDisponibles = [
    TypeExercice(
      id: 1,
      libelle: 'Course à pied',
      objectifDuree: const Duration(minutes: 30),
      objectifCalorie: 300,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.directions_run,
    ),
    TypeExercice(
      id: 2,
      libelle: 'Cyclisme',
      objectifDuree: const Duration(minutes: 60),
      objectifCalorie: 500,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.directions_bike,
    ),

    TypeExercice(
      id: 3,
      libelle: 'Natation',
      objectifDuree: const Duration(minutes: 45),
      objectifCalorie: 400,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.pool,
    ),

    TypeExercice(
      id: 4,
      libelle: 'Musculation',
      objectifDuree: const Duration(minutes: 60),
      objectifCalorie: 300,
      categorieExercice: CategorieExercice(id: 2, libelle: 'Renforcement'),
      iconType: Icons.fitness_center,
    ),

    TypeExercice(
      id: 5,
      libelle: 'Yoga',
      objectifDuree: const Duration(minutes: 45),
      objectifCalorie: 150,
      categorieExercice: CategorieExercice(id: 3, libelle: 'Flexibilité'),
      iconType: Icons.self_improvement,
    ),

    TypeExercice(
      id: 6,
      libelle: 'Boxe',
      objectifDuree: const Duration(minutes: 30),
      objectifCalorie: 350,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.sports_mma,
    ),

    TypeExercice(
      id: 7,
      libelle: 'Marche',
      objectifDuree: const Duration(minutes: 60),
      objectifCalorie: 200,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.directions_walk,
    ),

    TypeExercice(
      id: 8,
      libelle: 'Escalade',
      objectifDuree: const Duration(minutes: 90),
      objectifCalorie: 600,
      categorieExercice: CategorieExercice(id: 2, libelle: 'Renforcement'),
      iconType: Icons.terrain,
    ),

    TypeExercice(
      id: 9,
      libelle: 'Danse',
      objectifDuree: const Duration(minutes: 45),
      objectifCalorie: 250,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.music_note,
    ),
    // Ajoutez d'autres types d'exercices...
  ];

  void _ajouterExercice() async {
    final selectedTypeExercice = await showModalBottomSheet<TypeExercice>(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: typesExercicesDisponibles.length,
          itemBuilder: (context, index) {
            final typeExercice = typesExercicesDisponibles[index];
            return ListTile(
              leading: Icon(typeExercice.iconType),
              title: Text(typeExercice.libelle),
              onTap: () {
                Navigator.pop(context, typeExercice);
              },
            );
          },
        );
      },
    );

    if (selectedTypeExercice != null) {
      _definirObjectifCalorie(selectedTypeExercice);
    }
  }

  void _definirObjectifCalorie(TypeExercice typeExercice) {
    final _controller = TextEditingController(text: typeExercice.objectifCalorie.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Définir l\'objectif de calories'),
          content: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Calories',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Ferme la boîte de dialogue
              },
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                final objectifCalorie = int.tryParse(_controller.text) ?? typeExercice.objectifCalorie;
                setState(() {
                  exercicesSeance.add(
                    ExerciceSeance(
                      exercice: Exercice(
                        id: typeExercice.id,
                        libelle: typeExercice.libelle,
                        dureeRealisee: Duration.zero,
                        caloriePerdue: 0,
                        typeExercice: typeExercice,
                      ),
                      objectifCalorie: objectifCalorie,
                    ),
                  );
                });
                Navigator.pop(context); // Ferme la boîte de dialogue
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  void _terminerSeance() {
    // Calcule les données finales et enregistre la séance
    final seance = Seance(
      id: DateTime.now().millisecondsSinceEpoch,
      libelle: seanceLibelle,
      date: DateTime.now(),
      objectifCalorie: exercicesSeance.fold(0, (sum, e) => sum + e.objectifCalorie),
      exercices: exercicesSeance.map((e) => e.exercice).toList(),
    );

    // TODO: Enregistrer la séance (par exemple, l'ajouter à une liste globale ou l'enregistrer dans une base de données)

    // Réinitialise l'écran
    setState(() {
      exercicesSeance.clear();
      seanceLibelle = 'Nouvelle Séance';
    });

    // Affiche une confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Séance terminée et enregistrée')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma Séance'),
      ),
      body: Column(
        children: [
          // Affichage du libellé de la séance
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Nom de la séance',
              ),
              onChanged: (value) {
                setState(() {
                  seanceLibelle = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exercicesSeance.length,
              itemBuilder: (context, index) {
                final exerciceSeance = exercicesSeance[index];
                return ExerciceSeanceCard(
                  exerciceSeance: exerciceSeance,
                  onStateChanged: () {
                    setState(() {});
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: _ajouterExercice,
                icon: Icon(Icons.add),
                label: Text('Ajouter un exercice'),
              ),
              ElevatedButton.icon(
                onPressed: exercicesSeance.isNotEmpty ? _terminerSeance : null,
                icon: Icon(Icons.stop),
                label: Text('Terminer la séance'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}