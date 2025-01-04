import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/router/app_router.dart';
import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_dto.dart';

class TypeExerciceItemListe extends StatelessWidget {
  final TypeExerciceDTO typeExercice;

  const TypeExerciceItemListe({
    required this.typeExercice,
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

    return GestureDetector(
      onTap: () async {
        context.router.push(TypeExerciceDetailRoute(id: typeExercice.id));
      },
      child: ListTile(
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
          typeExercice.libelle,
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
              typeExercice.categorieExerciceResponse.libelle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange[900],
              ),
            ),
            Text(
              "Objectif calorique : ${typeExercice.objectifCalorique.toString()}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
