// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sportif_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sportifEditControllerHash() =>
    r'dcc9b457dfaaed4df0d7cc3134bac9e16923e317';

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

abstract class _$SportifEditController
    extends BuildlessAutoDisposeAsyncNotifier<SportifEditState> {
  late final int? id;

  FutureOr<SportifEditState> build(
    int? id,
  );
}

/// See also [SportifEditController].
@ProviderFor(SportifEditController)
const sportifEditControllerProvider = SportifEditControllerFamily();

/// See also [SportifEditController].
class SportifEditControllerFamily extends Family<AsyncValue<SportifEditState>> {
  /// See also [SportifEditController].
  const SportifEditControllerFamily();

  /// See also [SportifEditController].
  SportifEditControllerProvider call(
    int? id,
  ) {
    return SportifEditControllerProvider(
      id,
    );
  }

  @override
  SportifEditControllerProvider getProviderOverride(
    covariant SportifEditControllerProvider provider,
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
  String? get name => r'sportifEditControllerProvider';
}

/// See also [SportifEditController].
class SportifEditControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SportifEditController,
        SportifEditState> {
  /// See also [SportifEditController].
  SportifEditControllerProvider(
    int? id,
  ) : this._internal(
          () => SportifEditController()..id = id,
          from: sportifEditControllerProvider,
          name: r'sportifEditControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sportifEditControllerHash,
          dependencies: SportifEditControllerFamily._dependencies,
          allTransitiveDependencies:
              SportifEditControllerFamily._allTransitiveDependencies,
          id: id,
        );

  SportifEditControllerProvider._internal(
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
  FutureOr<SportifEditState> runNotifierBuild(
    covariant SportifEditController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(SportifEditController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SportifEditControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SportifEditController,
      SportifEditState> createElement() {
    return _SportifEditControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SportifEditControllerProvider && other.id == id;
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
mixin SportifEditControllerRef
    on AutoDisposeAsyncNotifierProviderRef<SportifEditState> {
  /// The parameter `id` of this provider.
  int? get id;
}

class _SportifEditControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SportifEditController,
        SportifEditState> with SportifEditControllerRef {
  _SportifEditControllerProviderElement(super.provider);

  @override
  int? get id => (origin as SportifEditControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
