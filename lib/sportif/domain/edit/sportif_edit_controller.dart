import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';
import 'package:flutter_project_app/sportif/data/dto/sportif_request_dto.dart';
import 'package:flutter_project_app/sportif/data/repository/sportif_repository.dart';
import 'package:flutter_project_app/sportif/domain/detail/sportif_detail_provider.dart';
import 'package:flutter_project_app/sportif/domain/edit/sportif_edit_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sportif_edit_controller.g.dart';

@riverpod
class SportifEditController extends _$SportifEditController {
  @override
  Future<SportifEditState> build(int? id) async {
    final SportifEditState initialState = id != null
        ? await _initialiserModification(id)
        : _initialiserCreation();
    return initialState;
  }

  Future<void> mettreAJour(
      FutureOr<SportifEditState> Function(SportifEditState previousState)
          newState) async {
    await update((state) {
      return newState(state);
    });
  }

  Future<int?> enregistrer() async {
    if (state.hasValue) {
      final SportifRequestDTO sportifEdition = SportifRequestDTO(
        nom: state.requireValue.nom,
        prenom: state.requireValue.prenom,
      );

      SportifDTO sportif;
      if (id != null) {
        sportif = await ref.watch(sportifRepositoryProvider.notifier).update(
              id: state.requireValue.id,
              data: sportifEdition,
            );
      } else {
        sportif = await ref.watch(sportifRepositoryProvider.notifier).create(
              data: sportifEdition,
            );
      }
      return sportif.id;
    }
    return null;
  }

  Future<void> supprimer() async {
    if (id != null) {
      await ref.watch(sportifRepositoryProvider.notifier).supprimer(id: id!);
    }
  }

  Future<SportifEditState> _initialiserModification(int id) async {
    final SportifDTO dto =
        await ref.watch(sportifDetailProvider(id: id).future);
    return SportifEditState.fromDTO(dto);
  }

  SportifEditState _initialiserCreation() {
    return const SportifEditState(
      id: 0,
      nom: '',
      prenom: '',
    );
  }
}
