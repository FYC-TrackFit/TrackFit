// models/categorie_exercice.dart

class CategorieExercice {
  final int id;
  final String libelle;

  CategorieExercice({
    required this.id,
    required this.libelle,
  });

  factory CategorieExercice.fromJson(Map<String, dynamic> json) {
    return CategorieExercice(
      id: json['id'],
      libelle: json['libelle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
    };
  }
}