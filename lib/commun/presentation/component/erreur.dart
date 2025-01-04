import 'package:flutter/material.dart';

class Erreur extends StatelessWidget {
  final String erreur;

  const Erreur({
    required this.erreur,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Erreur"),
      ),
      body: Text(erreur),
    );
  }
}
