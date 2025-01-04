import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_app/sportif/presentation/page/sportif_detail_page.dart';
import 'package:flutter_project_app/sportif/presentation/page/sportif_edit_page.dart';
import 'package:flutter_project_app/sportif/presentation/page/sportif_liste_page.dart';
import 'package:flutter_project_app/type_exercice/presentation/page/type_exercice_detail_page.dart';
import 'package:flutter_project_app/type_exercice/presentation/page/type_exercice_edit_page.dart';
import 'package:flutter_project_app/type_exercice/presentation/page/type_exercice_liste_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SportifListeRoute.page, initial: true),
        AutoRoute(page: SportifDetailRoute.page, path: '/sportifs/:id'),
        AutoRoute(page: SportifEditRoute.page, path: '/sportifs/:id'),
        AutoRoute(page: TypeExerciceListeRoute.page),
        AutoRoute(page: TypeExerciceDetailRoute.page, path: '/typesExercice/:id'),
        AutoRoute(page: TypeExerciceEditRoute.page, path: '/typesExercice/:id'),
      ];
}
