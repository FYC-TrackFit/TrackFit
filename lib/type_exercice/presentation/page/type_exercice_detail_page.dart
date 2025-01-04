import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/presentation/component/erreur.dart';
import 'package:flutter_project_app/commun/presentation/component/loader.dart';
import 'package:flutter_project_app/commun/router/app_router.dart';
import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_dto.dart';
import 'package:flutter_project_app/type_exercice/domain/detail/type_exercice_detail_provider.dart';
import 'package:flutter_project_app/type_exercice/domain/edit/type_exercice_edit_controller.dart';
import 'package:flutter_project_app/type_exercice/domain/liste/type_exercice_liste_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class TypeExerciceDetailPage extends ConsumerWidget {
  final int id;

  const TypeExerciceDetailPage({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<TypeExerciceDTO> typerExerciceAsyncValue =
        ref.watch(typeExerciceDetailProvider(id: id));

    return typerExerciceAsyncValue.when(
      data: (typeExercice) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Type exercice : ${typeExercice.libelle}"),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: Row(
            children: [
              OutlinedButton(
                onPressed: () async {
                  await _supprimer(
                    ref: ref,
                    context: context,
                  );
                },
                child: const Icon(Icons.clear),
              ),
              const SizedBox(
                width: 5,
              ),
              OutlinedButton(
                onPressed: () async {
                  await context.router.push(TypeExerciceEditRoute(id: id));
                },
                child: const Icon(Icons.edit),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  tileColor: Colors.purple[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: Icon(
                    Icons.sports,
                    size: 40,
                    color: Colors.purple[800],
                  ),
                  title: Text(
                    "Type d'exercice",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900],
                    ),
                  ),
                  subtitle: Text(
                    "Informations sur le type d'exercice",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple[900],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Libelle",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      typeExercice.libelle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Catégorie",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      typeExercice.categorieExerciceResponse.libelle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Objectif calorique",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      typeExercice.objectifCalorique.toString(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Objectif durrée",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      typeExercice.objectifDurre.toString(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nombre de répétition",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      typeExercice.repetition.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Erreur(erreur: error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }

  Future<void> _supprimer({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    await ref
        .watch(typeExerciceEditControllerProvider(id).notifier)
        .supprimer();
    ref.invalidate(typeExerciceListeProvider);
    if (context.mounted && context.router.canPop()) {
      context.router.popForced();
    }
  }
}
