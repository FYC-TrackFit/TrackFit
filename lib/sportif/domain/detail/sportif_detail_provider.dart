import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';
import 'package:flutter_project_app/sportif/data/repository/sportif_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sportif_detail_provider.g.dart';

@riverpod
Future<SportifDTO> sportifDetail(
  Ref ref, {
  required int id,
}) async {
  return await ref.watch(sportifRepositoryProvider.notifier).findById(id: id);
}
