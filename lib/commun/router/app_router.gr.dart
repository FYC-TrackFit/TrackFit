// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [SportifDetailPage]
class SportifDetailRoute extends PageRouteInfo<SportifDetailRouteArgs> {
  SportifDetailRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SportifDetailRoute.name,
          args: SportifDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SportifDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SportifDetailRouteArgs>();
      return SportifDetailPage(
        id: args.id,
        key: args.key,
      );
    },
  );
}

class SportifDetailRouteArgs {
  const SportifDetailRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'SportifDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [SportifEditPage]
class SportifEditRoute extends PageRouteInfo<SportifEditRouteArgs> {
  SportifEditRoute({
    int? id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SportifEditRoute.name,
          args: SportifEditRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SportifEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SportifEditRouteArgs>(
          orElse: () => const SportifEditRouteArgs());
      return SportifEditPage(
        id: args.id,
        key: args.key,
      );
    },
  );
}

class SportifEditRouteArgs {
  const SportifEditRouteArgs({
    this.id,
    this.key,
  });

  final int? id;

  final Key? key;

  @override
  String toString() {
    return 'SportifEditRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [SportifListePage]
class SportifListeRoute extends PageRouteInfo<void> {
  const SportifListeRoute({List<PageRouteInfo>? children})
      : super(
          SportifListeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SportifListeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SportifListePage();
    },
  );
}

/// generated route for
/// [TypeExerciceDetailPage]
class TypeExerciceDetailRoute
    extends PageRouteInfo<TypeExerciceDetailRouteArgs> {
  TypeExerciceDetailRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TypeExerciceDetailRoute.name,
          args: TypeExerciceDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TypeExerciceDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TypeExerciceDetailRouteArgs>();
      return TypeExerciceDetailPage(
        id: args.id,
        key: args.key,
      );
    },
  );
}

class TypeExerciceDetailRouteArgs {
  const TypeExerciceDetailRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'TypeExerciceDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [TypeExerciceEditPage]
class TypeExerciceEditRoute extends PageRouteInfo<TypeExerciceEditRouteArgs> {
  TypeExerciceEditRoute({
    int? id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TypeExerciceEditRoute.name,
          args: TypeExerciceEditRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TypeExerciceEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TypeExerciceEditRouteArgs>(
          orElse: () => const TypeExerciceEditRouteArgs());
      return TypeExerciceEditPage(
        id: args.id,
        key: args.key,
      );
    },
  );
}

class TypeExerciceEditRouteArgs {
  const TypeExerciceEditRouteArgs({
    this.id,
    this.key,
  });

  final int? id;

  final Key? key;

  @override
  String toString() {
    return 'TypeExerciceEditRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [TypeExerciceListePage]
class TypeExerciceListeRoute extends PageRouteInfo<void> {
  const TypeExerciceListeRoute({List<PageRouteInfo>? children})
      : super(
          TypeExerciceListeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TypeExerciceListeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TypeExerciceListePage();
    },
  );
}
