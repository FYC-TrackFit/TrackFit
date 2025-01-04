// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_exercice_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$typeExerciceDetailHash() =>
    r'2a85185c20a5f265f249038ce2f7206970b74d15';

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

/// See also [typeExerciceDetail].
@ProviderFor(typeExerciceDetail)
const typeExerciceDetailProvider = TypeExerciceDetailFamily();

/// See also [typeExerciceDetail].
class TypeExerciceDetailFamily extends Family<AsyncValue<TypeExerciceDTO>> {
  /// See also [typeExerciceDetail].
  const TypeExerciceDetailFamily();

  /// See also [typeExerciceDetail].
  TypeExerciceDetailProvider call({
    required int id,
  }) {
    return TypeExerciceDetailProvider(
      id: id,
    );
  }

  @override
  TypeExerciceDetailProvider getProviderOverride(
    covariant TypeExerciceDetailProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'typeExerciceDetailProvider';
}

/// See also [typeExerciceDetail].
class TypeExerciceDetailProvider
    extends AutoDisposeFutureProvider<TypeExerciceDTO> {
  /// See also [typeExerciceDetail].
  TypeExerciceDetailProvider({
    required int id,
  }) : this._internal(
          (ref) => typeExerciceDetail(
            ref as TypeExerciceDetailRef,
            id: id,
          ),
          from: typeExerciceDetailProvider,
          name: r'typeExerciceDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$typeExerciceDetailHash,
          dependencies: TypeExerciceDetailFamily._dependencies,
          allTransitiveDependencies:
              TypeExerciceDetailFamily._allTransitiveDependencies,
          id: id,
        );

  TypeExerciceDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<TypeExerciceDTO> Function(TypeExerciceDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TypeExerciceDetailProvider._internal(
        (ref) => create(ref as TypeExerciceDetailRef),
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
  AutoDisposeFutureProviderElement<TypeExerciceDTO> createElement() {
    return _TypeExerciceDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TypeExerciceDetailProvider && other.id == id;
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
mixin TypeExerciceDetailRef on AutoDisposeFutureProviderRef<TypeExerciceDTO> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TypeExerciceDetailProviderElement
    extends AutoDisposeFutureProviderElement<TypeExerciceDTO>
    with TypeExerciceDetailRef {
  _TypeExerciceDetailProviderElement(super.provider);

  @override
  int get id => (origin as TypeExerciceDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
