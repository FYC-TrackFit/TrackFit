// services/seance_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/seance.dart';

class SeanceService {
  final String baseUrl = 'http://10.0.2.2:8080/api/Seances'; // Pour l'émulateur Android

  Future<List<Seance>> fetchSeances() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Seance> seances = body.map((dynamic item) => Seance.fromJson(item)).toList();
      return seances;
    } else {
      throw Exception('Failed to load seances');
    }
  }

  Future<Seance> createSeance(Seance seance) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(seance.toJson()),
    );

    if (response.statusCode == 201) {
      return Seance.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create seance');
    }
  }
}