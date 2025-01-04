import 'dart:convert';

import 'package:flutter_project_app/categorie_exercice/data/dto/categorie_exercice_dto.dart';
import 'package:flutter_project_app/constante/const_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'categorie_exercice_repository.g.dart';

@riverpod
class CategorieExerciceRepository extends _$CategorieExerciceRepository {
  @override
  void build() {}

  Future<List<CategorieExerciceDTO>> lister() async {
    final url = Uri.parse('${ConstApi.url}/CategoriesExercices');

    final httpResponse = await http.get(url);
    final List<dynamic> responseRaw = json.decode(httpResponse.body);

    return responseRaw.map<CategorieExerciceDTO>((r) => CategorieExerciceDTO.fromJson(r)).toList();
  }
}
