import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/categorie_exercice/data/dto/categorie_exercice_dto.dart';
import 'package:flutter_project_app/categorie_exercice/domain/categorie_exercice_liste_provider.dart';
import 'package:flutter_project_app/commun/presentation/component/erreur.dart';
import 'package:flutter_project_app/commun/presentation/component/loader.dart';
import 'package:flutter_project_app/type_exercice/domain/detail/type_exercice_detail_provider.dart';
import 'package:flutter_project_app/type_exercice/domain/edit/type_exercice_edit_controller.dart';
import 'package:flutter_project_app/type_exercice/domain/edit/type_exercice_edit_state.dart';
import 'package:flutter_project_app/type_exercice/domain/liste/type_exercice_liste_provider.dart';
import 'package:flutter_project_app/type_exercice/presentation/component/categorie_exercice_dropdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

@RoutePage()
class TypeExerciceEditPage extends ConsumerWidget {
  final int? id;

  const TypeExerciceEditPage({
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<TypeExerciceEditState> typeExerciceAsyncValue =
        ref.watch(typeExerciceEditControllerProvider(id));
    final AsyncValue<List<CategorieExerciceDTO>> categoriesAsyncValue =
        ref.watch(categorieExerciceListeProvider);

    return typeExerciceAsyncValue.when(
      data: (typeExercice) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Type exercice",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
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
                            id != null
                                ? "Type exercice : ${typeExercice.libelle}"
                                : "Création d'un type exercice",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[900],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Libelle",
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              initialValue: typeExercice.libelle,
                              onChanged: (libelle) async {
                                await ref
                                    .watch(
                                        typeExerciceEditControllerProvider(id)
                                            .notifier)
                                    .mettreAJour(
                                      (typeExercice) => typeExercice.copyWith(
                                          libelle: libelle),
                                    );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Objectif calorique",
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              initialValue:
                                  typeExercice.objectifCalorique.toString(),
                              onChanged: (objectifCalorique) async {
                                await ref
                                    .watch(
                                        typeExerciceEditControllerProvider(id)
                                            .notifier)
                                    .mettreAJour(
                                      (typeExercice) => typeExercice.copyWith(
                                        objectifCalorique:
                                            int.tryParse(objectifCalorique),
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Objectif Durée",
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              initialValue:
                                  typeExercice.objectifDurre.toString(),
                              onChanged: (objectifDurre) async {
                                await ref
                                    .watch(
                                        typeExerciceEditControllerProvider(id)
                                            .notifier)
                                    .mettreAJour(
                                      (typeExercice) => typeExercice.copyWith(
                                        objectifDurre:
                                            int.tryParse(objectifDurre),
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Objectif Durée",
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              initialValue:
                                  typeExercice.objectifDurre.toString(),
                              onChanged: (objectifDurre) async {
                                await ref
                                    .watch(
                                        typeExerciceEditControllerProvider(id)
                                            .notifier)
                                    .mettreAJour(
                                      (typeExercice) => typeExercice.copyWith(
                                        objectifDurre:
                                            int.tryParse(objectifDurre),
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Nombre de répétitions",
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              initialValue: typeExercice.repetition.toString(),
                              onChanged: (repetition) async {
                                await ref
                                    .watch(
                                        typeExerciceEditControllerProvider(id)
                                            .notifier)
                                    .mettreAJour(
                                      (typeExercice) => typeExercice.copyWith(
                                        repetition: int.tryParse(repetition),
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Catégorie exercice",
                              textAlign: TextAlign.start,
                            ),
                            CategorieExerciceDropdown(
                              categories: categoriesAsyncValue.value ?? [],
                              onCategorySelected:
                                  (CategorieExerciceDTO value) async {
                                await ref
                                    .watch(
                                        typeExerciceEditControllerProvider(id)
                                            .notifier)
                                    .mettreAJour(
                                      (typeExercice) => typeExercice.copyWith(
                                        idCategorie: value.id,
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    final int? idTypeExercice = await ref
                        .watch(typeExerciceEditControllerProvider(id).notifier)
                        .enregistrer();
                    if (context.mounted && idTypeExercice != null) {
                      if (id != null) {
                        ref.invalidate(
                            typeExerciceDetailProvider(id: idTypeExercice));
                        ref.invalidate(typeExerciceListeProvider);
                      } else {
                        ref.invalidate(typeExerciceListeProvider);
                      }
                      if (context.router.canPop()) context.router.popForced();
                    }
                  },
                  child: const Text(
                    "Valider",
                  ),
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
}
