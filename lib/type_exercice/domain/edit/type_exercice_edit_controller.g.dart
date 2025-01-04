// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_exercice_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$typeExerciceEditControllerHash() =>
    r'593036e6e51a4fd87b94792ca39dd8fa35e04a43';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TypeExerciceEditController
    extends BuildlessAutoDisposeAsyncNotifier<TypeExerciceEditState> {
  late final int? id;

  FutureOr<TypeExerciceEditState> build(
    int? id,
  );
}

/// See also [TypeExerciceEditController].
@ProviderFor(TypeExerciceEditController)
const typeExerciceEditControllerProvider = TypeExerciceEditControllerFamily();

/// See also [TypeExerciceEditController].
class TypeExerciceEditControllerFamily
    extends Family<AsyncValue<TypeExerciceEditState>> {
  /// See also [TypeExerciceEditController].
  const TypeExerciceEditControllerFamily();

  /// See also [TypeExerciceEditController].
  TypeExerciceEditControllerProvider call(
    int? id,
  ) {
    return TypeExerciceEditControllerProvider(
      id,
    );
  }

  @override
  TypeExerciceEditControllerProvider getProviderOverride(
    covariant TypeExerciceEditControllerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'typeExerciceEditControllerProvider';
}

/// See also [TypeExerciceEditController].
class TypeExerciceEditControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TypeExerciceEditController,
        TypeExerciceEditState> {
  /// See also [TypeExerciceEditController].
  TypeExerciceEditControllerProvider(
    int? id,
  ) : this._internal(
          () => TypeExerciceEditController()..id = id,
          from: typeExerciceEditControllerProvider,
          name: r'typeExerciceEditControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$typeExerciceEditControllerHash,
          dependencies: TypeExerciceEditControllerFamily._dependencies,
          allTransitiveDependencies:
              TypeExerciceEditControllerFamily._allTransitiveDependencies,
          id: id,
        );

  TypeExerciceEditControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int? id;

  @override
  FutureOr<TypeExerciceEditState> runNotifierBuild(
    covariant TypeExerciceEditController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(TypeExerciceEditController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TypeExerciceEditControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TypeExerciceEditController,
      TypeExerciceEditState> createElement() {
    return _TypeExerciceEditControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TypeExerciceEditControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TypeExerciceEditControllerRef
    on AutoDisposeAsyncNotifierProviderRef<TypeExerciceEditState> {
  /// The parameter `id` of this provider.
  int? get id;
}

class _TypeExerciceEditControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TypeExerciceEditController,
        TypeExerciceEditState> with TypeExerciceEditControllerRef {
  _TypeExerciceEditControllerProviderElement(super.provider);

  @override
  int? get id => (origin as TypeExerciceEditControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
