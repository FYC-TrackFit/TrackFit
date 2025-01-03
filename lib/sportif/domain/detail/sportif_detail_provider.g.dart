// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sportif_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sportifDetailHash() => r'ca5665e0319620635312f5c728e429d74f44dd0a';

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

/// See also [sportifDetail].
@ProviderFor(sportifDetail)
const sportifDetailProvider = SportifDetailFamily();

/// See also [sportifDetail].
class SportifDetailFamily extends Family<AsyncValue<SportifDTO>> {
  /// See also [sportifDetail].
  const SportifDetailFamily();

  /// See also [sportifDetail].
  SportifDetailProvider call({
    required int id,
  }) {
    return SportifDetailProvider(
      id: id,
    );
  }

  @override
  SportifDetailProvider getProviderOverride(
    covariant SportifDetailProvider provider,
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
  String? get name => r'sportifDetailProvider';
}

/// See also [sportifDetail].
class SportifDetailProvider extends AutoDisposeFutureProvider<SportifDTO> {
  /// See also [sportifDetail].
  SportifDetailProvider({
    required int id,
  }) : this._internal(
          (ref) => sportifDetail(
            ref as SportifDetailRef,
            id: id,
          ),
          from: sportifDetailProvider,
          name: r'sportifDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sportifDetailHash,
          dependencies: SportifDetailFamily._dependencies,
          allTransitiveDependencies:
              SportifDetailFamily._allTransitiveDependencies,
          id: id,
        );

  SportifDetailProvider._internal(
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
    FutureOr<SportifDTO> Function(SportifDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SportifDetailProvider._internal(
        (ref) => create(ref as SportifDetailRef),
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
  AutoDisposeFutureProviderElement<SportifDTO> createElement() {
    return _SportifDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SportifDetailProvider && other.id == id;
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
mixin SportifDetailRef on AutoDisposeFutureProviderRef<SportifDTO> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SportifDetailProviderElement
    extends AutoDisposeFutureProviderElement<SportifDTO> with SportifDetailRef {
  _SportifDetailProviderElement(super.provider);

  @override
  int get id => (origin as SportifDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package