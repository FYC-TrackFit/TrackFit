import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';

class SportifEditState {
  final int id;
  final String nom;
  final String prenom;

  const SportifEditState({
    required this.id,
    required this.nom,
    required this.prenom,
  });

  factory SportifEditState.fromDTO(SportifDTO dto) {
    return SportifEditState(
      id: dto.id,
      nom: dto.nom,
      prenom: dto.prenom,
    );
  }

  SportifEditState copyWith({
    int? id,
    String? nom,
    String? prenom,
  }) {
    return SportifEditState(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
    );
  }
}
