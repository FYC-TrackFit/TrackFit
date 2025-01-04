import 'dart:convert';

import 'package:flutter_project_app/constante/const_api.dart';
import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_dto.dart';
import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_request_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'type_exercice_repository.g.dart';

@riverpod
class TypeExerciceRepository extends _$TypeExerciceRepository {
  @override
  void build() {}

  Future<List<TypeExerciceDTO>> lister() async {
    final url = Uri.parse('${ConstApi.url}/TypesExercices');

    final httpResponse = await http.get(url);
    final List<dynamic> responseRaw = json.decode(httpResponse.body);

    return responseRaw.map<TypeExerciceDTO>((r) => TypeExerciceDTO.fromJson(r)).toList();
  }

  Future<TypeExerciceDTO> findById({
    required int id,
  }) async {
    final url = Uri.parse('${ConstApi.url}/TypesExercices/$id');

    final httpResponse = await http.get(url);
    final responseRaw = json.decode(httpResponse.body);

    return TypeExerciceDTO.fromJson(responseRaw);
  }

  Future<TypeExerciceDTO> update({
    required int id,
    required TypeExerciceRequestDTO data,
  }) async {
    final url = Uri.parse('${ConstApi.url}/TypesExercices/$id');
    final httpResponse = await http.put(
      url,
      body: jsonEncode(data.toJson()),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final responseRaw = json.decode(httpResponse.body);

    return TypeExerciceDTO.fromJson(responseRaw);
  }

  Future<TypeExerciceDTO> create({
    required TypeExerciceRequestDTO data,
  }) async {
    final url = Uri.parse('${ConstApi.url}/TypesExercices');
    final httpResponse = await http.post(
      url,
      body: jsonEncode(data.toJson()),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final responseRaw = json.decode(httpResponse.body);

    return TypeExerciceDTO.fromJson(responseRaw);
  }

  Future<void> supprimer({
    required int id,
  }) async {
    final url = Uri.parse('${ConstApi.url}/TypesExercices/$id');
    await http.delete(url);
  }
}
