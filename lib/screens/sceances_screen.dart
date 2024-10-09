import 'package:flutter/material.dart';

class SceancesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Séances'),
      ),
      body: Center(
        child: Text('Liste des séances à venir'),
      ),
    );
  }
}