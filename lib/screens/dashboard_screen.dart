// screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import '../widgets/calories_summary_card.dart';
import '../widgets/seance_card.dart';
import '../models/seance.dart';
import '../services/seance_service.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final SeanceService _seanceService = SeanceService();
  List<Seance> seances = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSeances();
  }

  void fetchSeances() async {
    try {
      List<Seance> fetchedSeances = await _seanceService.fetchSeances();
      setState(() {
        seances = fetchedSeances;
        isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch seances: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = seances.fold(0, (sum, seance) => sum + seance.objectifCalorie);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: () async {
          fetchSeances();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CaloriesSummaryCard(totalCalories: totalCalories),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16.0),
                child: Text(
                  'Mes séances',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: seances.length,
                itemBuilder: (context, index) {
                  return SeanceCard(seance: seances[index]);
                },
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}