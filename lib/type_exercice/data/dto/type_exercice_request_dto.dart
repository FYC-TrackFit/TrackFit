class TypeExerciceRequestDTO {
  final String libelle;
  final int objectifDurre;
  final int objectifCalorique;
  final int repetition;
  final int idCategorie;

  const TypeExerciceRequestDTO({
    required this.libelle,
    required this.objectifDurre,
    required this.objectifCalorique,
    required this.repetition,
    required this.idCategorie,
  });

  Map<String, dynamic> toJson() {
    return {
      'libelle': libelle,
      'objectifDurre': objectifDurre,
      'objectifCalorique': objectifCalorique,
      'repetition': repetition,
      'idCategorie': idCategorie,
    };
  }
}
