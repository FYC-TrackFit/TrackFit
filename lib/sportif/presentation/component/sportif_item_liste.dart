import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';

class SportifItemListe extends StatelessWidget {
  final SportifDTO sportif;

  const SportifItemListe({
    required this.sportif,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.directions_run,
      Icons.directions_bike,
      Icons.pool,
      Icons.directions_walk,
    ];

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      tileColor: Colors.orange[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: Icon(
        icons[Random().nextInt(icons.length)],
        size: 40,
        color: Colors.orange[800],
      ),
      title: Text(
        "Sportif",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.orange[900],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sportif.prenom,
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange[900],
            ),
          ),
        ],
      ),
    );
  }
}
