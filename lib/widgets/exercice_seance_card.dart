import 'dart:async';

import 'package:flutter/material.dart';
import '../models/exercice_seance.dart';

class ExerciceSeanceCard extends StatefulWidget {
  final ExerciceSeance exerciceSeance;
  final VoidCallback onStateChanged;

  const ExerciceSeanceCard({
    super.key,
    required this.exerciceSeance,
    required this.onStateChanged,
  });

  @override
  _ExerciceSeanceCardState createState() => _ExerciceSeanceCardState();
}

class _ExerciceSeanceCardState extends State<ExerciceSeanceCard> {
  void _startExercice() {
    if (widget.exerciceSeance.state == ExerciceState.notStarted || widget.exerciceSeance.state == ExerciceState.paused) {
      widget.exerciceSeance.state = ExerciceState.running;
      widget.exerciceSeance.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          widget.exerciceSeance.tempsEcoule += const Duration(seconds: 1);
        });
      });
      widget.onStateChanged();
    }
  }

  void _pauseExercice() {
    if (widget.exerciceSeance.state == ExerciceState.running) {
      widget.exerciceSeance.state = ExerciceState.paused;
      widget.exerciceSeance.timer?.cancel();
      widget.onStateChanged();
    }
  }

  @override
  void dispose() {
    widget.exerciceSeance.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exerciceSeance = widget.exerciceSeance;
    final exercice = exerciceSeance.exercice;
    final tempsEcoule = exerciceSeance.tempsEcoule;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(exercice.typeExercice.iconType, size: 40),
        title: Text(exercice.libelle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Objectif : ${exerciceSeance.objectifCalorie} kcal'),
            Text('Temps écoulé : ${_formatDuration(tempsEcoule)}'),
            Text('État : ${_getStateLabel(exerciceSeance.state)}'),
          ],
        ),
        trailing: _buildTrailingButtons(exerciceSeance.state),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '${duration.inHours}:$minutes:$seconds';
  }

  String _getStateLabel(ExerciceState state) {
    switch (state) {
      case ExerciceState.notStarted:
        return 'Non démarré';
      case ExerciceState.running:
        return 'En cours';
      case ExerciceState.paused:
        return 'En pause';
      case ExerciceState.completed:
        return 'Terminé';
      default:
        return '';
    }
  }

  Widget _buildTrailingButtons(ExerciceState state) {
    switch (state) {
      case ExerciceState.notStarted:
      case ExerciceState.paused:
        return IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: _startExercice,
        );
      case ExerciceState.running:
        return IconButton(
          icon: const Icon(Icons.pause),
          onPressed: _pauseExercice,
        );
      case ExerciceState.completed:
        return const Icon(Icons.check, color: Colors.green);
      default:
        return Container();
    }
  }
}