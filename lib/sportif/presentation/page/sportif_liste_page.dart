import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/presentation/component/erreur.dart';
import 'package:flutter_project_app/commun/presentation/component/loader.dart';
import 'package:flutter_project_app/commun/router/app_router.dart';
import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';
import 'package:flutter_project_app/sportif/domain/list/sportif_liste_provider.dart';
import 'package:flutter_project_app/sportif/presentation/component/sportif_item_liste.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SportifListePage extends ConsumerWidget {
  const SportifListePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<SportifDTO>> sportifsAsyncValue =
        ref.watch(sportifListeProvider);

    return sportifsAsyncValue.when(
      data: (
        List<SportifDTO> sportifs,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Liste des sportifs"),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  context.router.push(const TypeExerciceListeRoute());
                },
                child: Icon(
                  Icons.e_mobiledata,
                  color: Colors.red[900],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              OutlinedButton(
                onPressed: () {
                  ref.invalidate(sportifListeProvider);
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
                  context.router.push(SportifEditRoute());
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
              itemCount: sportifs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: SportifItemListe(
                    sportif: sportifs[index],
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
