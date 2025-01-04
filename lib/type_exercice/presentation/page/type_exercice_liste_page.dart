import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/presentation/component/erreur.dart';
import 'package:flutter_project_app/commun/presentation/component/loader.dart';
import 'package:flutter_project_app/commun/router/app_router.dart';
import 'package:flutter_project_app/type_exercice/data/dto/type_exercice_dto.dart';
import 'package:flutter_project_app/type_exercice/domain/liste/type_exercice_liste_provider.dart';
import 'package:flutter_project_app/type_exercice/presentation/component/type_exercice_item_liste.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class TypeExerciceListePage extends ConsumerWidget {
  const TypeExerciceListePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<TypeExerciceDTO>> typesExercicesAsyncValue =
        ref.watch(typeExerciceListeProvider);

    return typesExercicesAsyncValue.when(
      data: (
        List<TypeExerciceDTO> typesExercices,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Liste des types d'exercices"),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  ref.invalidate(typeExerciceListeProvider);
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.orange[900],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              OutlinedButton(
                onPressed: () {
                  context.router.push(TypeExerciceEditRoute());
                },
                child: Icon(
                  Icons.add,
                  color: Colors.orange[900],
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: typesExercices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: TypeExerciceItemListe(
                    typeExercice: typesExercices[index],
                  ),
                );
              },
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
}
