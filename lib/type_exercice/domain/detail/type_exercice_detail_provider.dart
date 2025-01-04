import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_dto.dart';
import 'package:flutter_project_app/type_exercice/data/repository/type_exercice_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'type_exercice_detail_provider.g.dart';

@riverpod
Future<TypeExerciceDTO> typeExerciceDetail(
  Ref ref, {
  required int id,
}) async {
  return await ref.watch(typeExerciceRepositoryProvider.notifier).findById(id: id);
}
