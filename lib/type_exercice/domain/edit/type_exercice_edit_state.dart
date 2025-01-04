import 'package:flutter_project_app/categorie_exercice/data/dto/categorie_exercice_dto.dart';
import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_dto.dart';

class TypeExerciceEditState {
  final int id;
  final String libelle;
  final int objectifDurre;
  final int objectifCalorique;
  final int repetition;
  final int idCategorie;
  final CategorieExerciceDTO? categorieExercice;

  const TypeExerciceEditState({
    required this.id,
    required this.libelle,
    required this.objectifDurre,
    required this.objectifCalorique,
    required this.repetition,
    required this.idCategorie,
    required this.categorieExercice,
  });

  factory TypeExerciceEditState.fromDTO(TypeExerciceDTO dto) {
    return TypeExerciceEditState(
      id: dto.id,
      libelle: dto.libelle,
      objectifDurre: dto.objectifDurre,
      objectifCalorique: dto.objectifCalorique,
      repetition: dto.repetition,
      idCategorie: dto.categorieExerciceResponse.id,
      categorieExercice: dto.categorieExerciceResponse,
    );
  }

  TypeExerciceEditState copyWith({
    int? id,
    String? libelle,
    int? objectifDurre,
    int? objectifCalorique,
    int? repetition,
    int? idCategorie,
    CategorieExerciceDTO? categorieExercice,
  }) {
    return TypeExerciceEditState(
      id: id ?? this.id,
      libelle: libelle ?? this.libelle,
      objectifDurre: objectifDurre ?? this.objectifDurre,
      objectifCalorique: objectifCalorique ?? this.objectifCalorique,
      repetition: repetition ?? this.repetition,
      idCategorie: idCategorie ?? this.idCategorie,
      categorieExercice: categorieExercice ?? this.categorieExercice,
    );
  }
}
