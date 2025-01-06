import 'package:flutter/material.dart';
import 'package:flutter_project_app/commun/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    // 2. On ignore la validité du certificat
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    ProviderScope(
      child: _MyApp(),
    ),
  );
}

class _MyApp extends StatelessWidget {
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
