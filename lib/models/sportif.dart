// models/sportif.dart

class Sportif {
  final int id;
  final String nom;
  final String prenom;

  Sportif({
    required this.id,
    required this.nom,
    required this.prenom,
  });

  factory Sportif.fromJson(Map<String, dynamic> json) {
    return Sportif(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
    };
  }
}