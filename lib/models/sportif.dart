import 'seance.dart';

class Sportif {
  final int id;
  final String nom;
  final String prenom;
  final List<Seance> seances;

  Sportif({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.seances,
  });
}