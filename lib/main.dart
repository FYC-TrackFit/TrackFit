import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/router/app_router.dart';
import 'package:flutter_project_app/sportif/presentation/page/sportif_detail_page.dart';
import 'package:flutter_project_app/sportif/presentation/page/sportif_liste_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/dashboard_screen.dart';
import 'screens/seance_screen.dart';
import 'screens/others_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Enregistreur d\'Entraînements',
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Liste des écrans correspondant à chaque onglet
  static final List<Widget> _widgetOptions = <Widget>[
    const SportifListePage(),
    const SportifDetailPage(id: 2),
    DashboardScreen(),
    const SeanceScreen(),
    OthersScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Le contenu principal derrière la BottomNavigationBar
          _widgetOptions.elementAt(_selectedIndex),

          // Positionner le BackdropFilter et la BottomNavigationBar flottante au bas de l'écran
          Positioned(
            bottom:
                20, // Espace en dessous de la barre pour la rendre flottante
            left: 20,
            right: 20,
            child: _buildFloatingBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  // Fonction pour construire la BottomNavigationBar stylisée avec effet de flou et flottante
  Widget _buildFloatingBottomNavigationBar() {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(30), // Coins arrondis pour l'effet flottant
      child: Container(
        height: 70, // Hauteur de la barre
        decoration: BoxDecoration(
          // Couleur noire avec opacité de 0.6
          borderRadius: BorderRadius.circular(30), // Coins arrondis
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // Arrière-plan avec effet de flou
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10.0, sigmaY: 10.0), // Intensité du flou
              child: Container(
                color: Colors.black
                    .withOpacity(0.3), // Couleur noire semi-transparente
              ),
            ),
            // Contenu de la BottomNavigationBar
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              // Fond transparent pour montrer le flou en dessous
              elevation: 0,
              // Retirer l'ombre de la BottomNavigationBar
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              // Couleur de l'élément sélectionné
              unselectedItemColor: Colors.white.withOpacity(0.6),
              // Couleur des éléments non sélectionnés
              iconSize: 30,
              // Ajuste la taille des icônes
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: 'Sportifs', // Supprime le label
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Sportif detail', // Supprime le label
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Résumé', // Supprime le label
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center),
                  label: 'Ma séance', // Supprime le label
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
