import 'dart:convert';

import 'package:flutter_project_app/constante/const_api.dart';
import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';
import 'package:flutter_project_app/sportif/data/dto/sportif_request_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'sportif_repository.g.dart';

@riverpod
class SportifRepository extends _$SportifRepository {
  @override
  void build() {}

  Future<List<SportifDTO>> lister() async {
    final url = Uri.parse('${ConstApi.url}/Sportifs');

    final httpResponse = await http.get(url);
    final List<dynamic> responseRaw = json.decode(httpResponse.body);

    return responseRaw.map<SportifDTO>((r) => SportifDTO.fromJson(r)).toList();
  }

  Future<SportifDTO> findById({
    required int id,
  }) async {
    final url = Uri.parse('${ConstApi.url}/Sportifs/$id');

    final httpResponse = await http.get(url);
    final responseRaw = json.decode(httpResponse.body);

    return SportifDTO.fromJson(responseRaw);
  }

  Future<SportifDTO> update({
    required int id,
    required SportifRequestDTO data,
  }) async {
    final url = Uri.parse('${ConstApi.url}/Sportifs/$id');
    final httpResponse = await http.put(
      url,
      body: jsonEncode(data.toJson()),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final responseRaw = json.decode(httpResponse.body);

    return SportifDTO.fromJson(responseRaw);
  }

  Future<SportifDTO> create({
    required SportifRequestDTO data,
  }) async {
    final url = Uri.parse('${ConstApi.url}/Sportifs');
    final httpResponse = await http.post(
      url,
      body: jsonEncode(data.toJson()),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final responseRaw = json.decode(httpResponse.body);

    return SportifDTO.fromJson(responseRaw);
  }

  Future<void> supprimer({
    required int id,
  }) async {
    final url = Uri.parse('${ConstApi.url}/Sportifs/$id');
    await http.delete(url);
  }
}
