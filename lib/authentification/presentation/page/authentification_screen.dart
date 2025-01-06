import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../commun/router/app_router.dart';
import '../../domain/authentification_service.dart';

@RoutePage()
class AuthenticationScreen extends StatelessWidget {
  final AuthenticationService _authenticationService = AuthenticationService();

  AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TrackFit",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey, // Couleur neutre pour l'AppBar
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade100, // Fond clair et neutre
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Bienvenue !",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade800,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Connectez-vous pour continuer",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey.shade600,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () async {
                        bool loginSuccessful =
                            await _authenticationService.login();
                        if (loginSuccessful) {
                          // Navigue vers SportifListeRoute après une connexion réussi
                          if (context.mounted) {
                            context.router.push(const HomeRoute());
                          }
                        } else {
                          // Affiche une erreur si le login échoue
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Connexion échouée, merci de réessayer."),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Couleur du bouton
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Connexion",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
