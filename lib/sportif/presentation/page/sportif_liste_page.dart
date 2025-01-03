import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/presentation/component/loader.dart';
import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';
import 'package:flutter_project_app/sportif/domain/list/sportif_liste_provider.dart';
import 'package:flutter_project_app/sportif/presentation/component/sportif_item_liste.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        return Scaffold(
          appBar: AppBar(
            title: const Text("Erreur"),
          ),
          body: Text(error.toString()),
        );
      },
      loading: () {
        return const Loader();
      },
    );
  }
}
