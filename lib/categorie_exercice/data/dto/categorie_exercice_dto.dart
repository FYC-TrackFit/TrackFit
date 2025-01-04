class CategorieExerciceDTO {
  final int id;
  final String libelle;

  const CategorieExerciceDTO({
    required this.id,
    required this.libelle,
  });

  factory CategorieExerciceDTO.fromJson(Map<String, dynamic> json) {
    return CategorieExerciceDTO(
      id: json['id'],
      libelle: json['libelle'],
    );
  }
}
