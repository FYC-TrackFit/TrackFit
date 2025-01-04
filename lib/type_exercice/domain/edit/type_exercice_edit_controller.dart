import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_dto.dart';
import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_request_dto.dart';
import 'package:flutter_project_app/type_exercice/data/repository/type_exercice_repository.dart';
import 'package:flutter_project_app/type_exercice/domain/detail/type_exercice_detail_provider.dart';
import 'package:flutter_project_app/type_exercice/domain/edit/type_exercice_edit_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'type_exercice_edit_controller.g.dart';

@riverpod
class TypeExerciceEditController extends _$TypeExerciceEditController {
  @override
  Future<TypeExerciceEditState> build(int? id) async {
    final TypeExerciceEditState initialState = id != null
        ? await _initialiserModification(id)
        : _initialiserCreation();
    return initialState;
  }

  Future<void> mettreAJour(
      FutureOr<TypeExerciceEditState> Function(
              TypeExerciceEditState previousState)
          newState) async {
    await update((state) {
      return newState(state);
    });
  }

  Future<int?> enregistrer() async {
    if (state.hasValue) {
      final TypeExerciceRequestDTO sportifEdition = TypeExerciceRequestDTO(
        libelle: state.requireValue.libelle,
        objectifDurre: state.requireValue.objectifDurre,
        objectifCalorique: state.requireValue.objectifCalorique,
        repetition: state.requireValue.repetition,
        idCategorie: state.requireValue.idCategorie,
      );

      TypeExerciceDTO sportif;
      if (id != null) {
        sportif =
            await ref.watch(typeExerciceRepositoryProvider.notifier).update(
                  id: state.requireValue.id,
                  data: sportifEdition,
                );
      } else {
        sportif =
            await ref.watch(typeExerciceRepositoryProvider.notifier).create(
                  data: sportifEdition,
                );
      }
      return sportif.id;
    }
    return null;
  }

  Future<void> supprimer() async {
    if (id != null) {
      await ref
          .watch(typeExerciceRepositoryProvider.notifier)
          .supprimer(id: id!);
    }
  }

  Future<TypeExerciceEditState> _initialiserModification(int id) async {
    final TypeExerciceDTO dto =
        await ref.watch(typeExerciceDetailProvider(id: id).future);
    return TypeExerciceEditState.fromDTO(dto);
  }

  TypeExerciceEditState _initialiserCreation() {
    return const TypeExerciceEditState(
      id: 0,
      libelle: '',
      objectifDurre: 0,
      objectifCalorique: 0,
      repetition: 0,
      idCategorie: 0,
      categorieExercice: null,
    );
  }
}
