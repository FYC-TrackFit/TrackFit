import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/presentation/component/erreur.dart';
import 'package:flutter_project_app/commun/presentation/component/loader.dart';
import 'package:flutter_project_app/commun/router/app_router.dart';
import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';
import 'package:flutter_project_app/sportif/domain/detail/sportif_detail_provider.dart';
import 'package:flutter_project_app/sportif/domain/edit/sportif_edit_controller.dart';
import 'package:flutter_project_app/sportif/domain/list/sportif_liste_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SportifDetailPage extends ConsumerWidget {
  final int id;

  const SportifDetailPage({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<SportifDTO> sportifAsyncValue =
        ref.watch(sportifDetailProvider(id: id));

    return sportifAsyncValue.when(
      data: (sportif) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Sportif : ${sportif.nom}"),
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
                  await context.router.push(SportifEditRoute(id: id));
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
                    Icons.people_alt,
                    size: 40,
                    color: Colors.purple[800],
                  ),
                  title: Text(
                    "Sportif",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900],
                    ),
                  ),
                  subtitle: Text(
                    "Informations générales sur le sportif",
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
                      "Nom",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sportif.nom,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Prénom",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sportif.prenom,
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
    await ref.watch(sportifEditControllerProvider(id).notifier).supprimer();
    ref.invalidate(sportifListeProvider);
    if (context.mounted && context.router.canPop()) {
      context.router.popForced();
    }
  }
}
