import 'package:flutter/material.dart';
import 'package:flutter_project_app/models/categorie_exercice.dart';
import '../models/exercice.dart';
import '../models/exercice_seance.dart';
import '../models/seance.dart';
import '../models/type_exercice.dart';
import '../widgets/exercice_seance_card.dart';
import '../services/seance_service.dart';


class SeanceScreen extends StatefulWidget {
  const SeanceScreen({Key? key}) : super(key: key);

  @override
  _SeanceScreenState createState() => _SeanceScreenState();
}

class _SeanceScreenState extends State<SeanceScreen> {
  final SeanceService _seanceService = SeanceService();

  List<ExerciceSeance> exercicesSeance = [];
  String seanceLibelle = 'Nouvelle Séance';

  // Données d'exemple pour les types d'exercice (vous pouvez les récupérer de votre source de données réelle)
  final List<TypeExercice> typesExercicesDisponibles = [
    TypeExercice(
      id: 1,
      libelle: 'Course à pied',
      objectifDuree: 30,
      objectifCalorie: 300,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.directions_run,
    ),
    TypeExercice(
      id: 2,
      libelle: 'Cyclisme',
      objectifDuree: 60,
      objectifCalorie: 500,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.directions_bike,
    ),

    TypeExercice(
      id: 3,
      libelle: 'Natation',
      objectifDuree: 45,
      objectifCalorie: 400,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.pool,
    ),

    TypeExercice(
      id: 4,
      libelle: 'Musculation',
      objectifDuree: 60,
      objectifCalorie: 300,
      categorieExercice: CategorieExercice(id: 2, libelle: 'Renforcement'),
      iconType: Icons.fitness_center,
    ),

    TypeExercice(
      id: 5,
      libelle: 'Yoga',
      objectifDuree: 45,
      objectifCalorie: 150,
      categorieExercice: CategorieExercice(id: 3, libelle: 'Flexibilité'),
      iconType: Icons.self_improvement,
    ),

    TypeExercice(
      id: 6,
      libelle: 'Boxe',
      objectifDuree: 30,
      objectifCalorie: 350,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.sports_mma,
    ),

    TypeExercice(
      id: 7,
      libelle: 'Marche',
      objectifDuree: 60,
      objectifCalorie: 200,
      categorieExercice: CategorieExercice(id: 1, libelle: 'Cardio'),
      iconType: Icons.directions_walk,
    ),

    TypeExercice(
      id: 8,
      libelle: 'Escalade',
      objectifDuree: 90,
      objectifCalorie: 600,
      categorieExercice: CategorieExercice(id: 2, libelle: 'Renforcement'),
      iconType: Icons.terrain,
    ),

    TypeExercice(
      id: 9,
      libelle: 'Danse',
      objectifDuree: 45,
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
                        dureeRealisee: 0,
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

  void _terminerSeance() async {
    int totalObjectifCalorie = exercicesSeance.fold(0, (sum, e) => sum + e.objectifCalorie);

    final seance = Seance(
      id: 0, // L'ID sera attribué par le backend
      libelle: seanceLibelle,
      date: DateTime.now(),
      objectifCalorie: totalObjectifCalorie,
      sportif: Sportif(id: 1, nom: 'Dupont', prenom: 'Jean'), // Remplacez par les données réelles
      exercices: exercicesSeance.map((e) {
        return Exercice(
          id: 0, // L'ID sera attribué par le backend
          libelle: e.exercice.libelle,
          dureeRealisee: e.tempsEcoule.inSeconds,
          caloriePerdue: e.objectifCalorie,
          typeExercice: e.exercice.typeExercice,
        );
      }).toList(),
    );

    try {
      Seance createdSeance = await _seanceService.createSeance(seance);

      // Retourner au Dashboard ou mettre à jour l'état
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Séance terminée et enregistrée')),
      );
    } catch (e) {
      print('Failed to save seance: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Échec de l\'enregistrement de la séance')),
      );
    }

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