import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/router/app_router.dart';
import 'package:flutter_project_app/screens/dashboard_screen.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        context.router.push(const SportifListeRoute());
        break;
      case 2:
        context.router.push(const TypeExerciceListeRoute());
        break;
    }
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

  Widget _buildFloatingBottomNavigationBar() {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(30),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black
                    .withOpacity(0.3),
              ),
            ),
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(0.6),
              iconSize: 30,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Résumé',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Sportifs',
                ),
                BottomNavigationBarItem(
                  activeIcon: GestureDetector(),
                  icon: const Icon(Icons.sports),
                  label: 'Types d\'exercices',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
