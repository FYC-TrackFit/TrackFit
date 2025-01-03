class SportifDTO {
  final int id;
  final String nom;
  final String prenom;

  const SportifDTO({
    required this.id,
    required this.nom,
    required this.prenom,
  });

  factory SportifDTO.fromJson(Map<String, dynamic> json) {
    return SportifDTO(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
    );
  }
}
