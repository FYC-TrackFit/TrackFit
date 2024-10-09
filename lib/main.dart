import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/sceances_screen.dart';
import 'screens/others_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Racine de l'application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enregistreur d\'Entraînements',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
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
  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    SceancesScreen(),
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
      // Contenu de l'onglet sélectionné
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Tableau de bord'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Séances'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Autres'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}