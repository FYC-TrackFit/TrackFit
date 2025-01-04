class SportifRequestDTO {
  final String nom;
  final String prenom;

  const SportifRequestDTO({
    required this.nom,
    required this.prenom,
  });

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
    };
  }
}
