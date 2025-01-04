import 'package:flutter_project_app/categorie_exercice/data/dto/categorie_exercice_dto.dart';
import 'package:flutter_project_app/categorie_exercice/data/repository/categorie_exercice_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categorie_exercice_liste_provider.g.dart';

@riverpod
Future<List<CategorieExerciceDTO>> categorieExerciceListe(Ref ref) async {
  return await ref.watch(categorieExerciceRepositoryProvider.notifier).lister();
}
