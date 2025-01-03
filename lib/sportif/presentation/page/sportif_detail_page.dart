import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/presentation/component/loader.dart';
import 'package:flutter_project_app/sportif/data/dto/sportif_dto.dart';
import 'package:flutter_project_app/sportif/domain/detail/sportif_detail_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sportif.prenom,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple[900],
                        ),
                      ),
                      Text(
                        sportif.nom,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
