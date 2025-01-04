import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/presentation/component/erreur.dart';
import 'package:flutter_project_app/commun/presentation/component/loader.dart';
import 'package:flutter_project_app/sportif/domain/detail/sportif_detail_provider.dart';
import 'package:flutter_project_app/sportif/domain/edit/sportif_edit_controller.dart';
import 'package:flutter_project_app/sportif/domain/edit/sportif_edit_state.dart';
import 'package:flutter_project_app/sportif/domain/list/sportif_liste_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SportifEditPage extends ConsumerWidget {
  final int? id;

  const SportifEditPage({
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<SportifEditState> sportif =
        ref.watch(sportifEditControllerProvider(id));

    return sportif.when(
      data: (sportif) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Sportif",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      tileColor: Colors.purple[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      leading: Icon(
                        Icons.people_alt,
                        size: 40,
                        color: Colors.purple[800],
                      ),
                      title: Text(
                        id != null
                            ? "Sportif : ${sportif.prenom}"
                            : "Création d'un sportif",
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
                          "Nom",
                          textAlign: TextAlign.start,
                        ),
                        TextFormField(
                          initialValue: sportif.nom,
                          onChanged: (nom) async {
                            await ref
                                .watch(
                                    sportifEditControllerProvider(id).notifier)
                                .mettreAJour(
                                  (sportif) => sportif.copyWith(nom: nom),
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
                          "Prenom",
                          textAlign: TextAlign.start,
                        ),
                        TextFormField(
                          initialValue: sportif.prenom,
                          onChanged: (prenom) async {
                            await ref
                                .watch(
                                    sportifEditControllerProvider(id).notifier)
                                .mettreAJour(
                                  (sportif) => sportif.copyWith(prenom: prenom),
                                );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () async {
                    final int? idSportif = await ref
                        .watch(sportifEditControllerProvider(id).notifier)
                        .enregistrer();
                    if (context.mounted && idSportif != null) {
                      if (id != null) {
                        ref.invalidate(sportifDetailProvider(id: idSportif));
                        ref.invalidate(sportifListeProvider);
                      } else {
                        ref.invalidate(sportifListeProvider);
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
